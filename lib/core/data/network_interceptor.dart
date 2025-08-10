import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';

import '../../di.dart';

class NetworkInterceptor extends Interceptor with InterceptorMixin {
  final Logger log = Logger("Dio Interceptor");
  Dio dio = di<Dio>(instanceName: "interceptor");
  LocalStorageManager localStoreManager = di<LocalStorageManager>(
    instanceName: "interceptor",
  );
  final NetworkRequestRetrier requestRetrier;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  NetworkInterceptor({NetworkRequestRetrier? requestRetrier})
    : requestRetrier =
          requestRetrier ??
          NetworkRequestRetrier(
            dio: di<Dio>(instanceName: "interceptor"),
            internetConnectionChecker: InternetConnectionChecker.createInstance(
              checkInterval: const Duration(seconds: 5),
              checkTimeout: const Duration(seconds: 5),
            ),
          );

  String _formatRequestBody(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      } else if (data is FormData) {
        final fields = data.fields
            .map((e) => '${e.key}: ${e.value}')
            .join(', ');
        final files = data.files
            .map((e) => '${e.key}: ${e.value.filename}')
            .join(', ');
        return 'FormData: { fields: {$fields}, files: {$files} }';
      } else {
        return data.toString();
      }
    } catch (e) {
      return 'Could not format request body: $e';
    }
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await localStoreManager.readFromStorage(
      "refresh_token",
    );
    if (refreshToken == null) return null;

    try {
      final response = await dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await localStoreManager.writeToStorage("access_token", newAccessToken);
      await localStoreManager.writeToStorage("refresh_token", newRefreshToken);
      return newAccessToken;
    } catch (e) {
      log.severe("Token refresh failed: $e");
      return null;
    }
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.fine("➡️ Request [${options.method}] => URL: ${options.uri}");
    log.fine("➡️ Headers: ${options.headers}");
    log.info("➡️ On Send Progress: ${options.onSendProgress}");

    if (options.data != null) {
      log.fine("➡️ Body: ${_formatRequestBody(options.data)}");
    }
    options.headers["Content-Type"] = "application/json";
    options.headers["x-api-key"] = "reqres-free-v1";

    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, handler) {
    log.fine("Response: ${response.requestOptions.uri}");
    if (response.data is String) {
      jsonDecode(response.data);
    }
    if (response.statusCode == 304) {
      log.shout("cache hit: ${response.requestOptions.uri}");
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(err, handler) async {
    log.severe("Error: ${err.requestOptions.uri}");
    if (isBadRequest(err)) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: BadRequestException(message: err.response!.data["error"]),
        ),
      );
    } else if (isUnauthorized(err)) {
      if (_isRefreshing) {
        _retryQueue.add(() async {
          final retryResponse = await dio.fetch(err.requestOptions);
          handler.resolve(retryResponse);
        });
        return;
      }

      _isRefreshing = true;

      try {
        final newToken = await _refreshToken();
        _isRefreshing = false;

        if (newToken != null) {
          final newToken = await _refreshToken();
          _isRefreshing = false;

          if (newToken != null) {
            for (final retry in _retryQueue) {
              await retry();
            }
            _retryQueue.clear();

            // Retry original request
            final cloneReq = await _retryRequest(err.requestOptions);
            return handler.resolve(cloneReq);
          } else {
            await localStoreManager.deleteFromStorage("access_token");
            await localStoreManager.deleteFromStorage("refresh_token");
            return handler.reject(
              DioException(
                requestOptions: err.requestOptions,
                error: UnauthorizedException(message: "Session expired"),
              ),
            );
          }
        }
      } catch (e) {
        _isRefreshing = false;
        await localStoreManager.deleteFromStorage("access_token");
        await localStoreManager.deleteFromStorage("refresh_token");

        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnauthorizedException(message: err.response!.data["error"]),
          ),
        );
      }
    } else if (isForbidden(err)) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: ForbiddenException(),
        ),
      );
    } else if (isNotFound(err)) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NotFoundException(),
        ),
      );
    } else if (isConnectionError(err)) {
      try {
        log.warning("Connection Error: ${err.requestOptions.uri}");
        final response = await requestRetrier.retryRequest(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        log.severe("Connection Error: ${err.requestOptions.uri}");
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NetworkException(),
          ),
        );
      }
    } else {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: UnknownException(),
        ),
      );
    }
  }
}
