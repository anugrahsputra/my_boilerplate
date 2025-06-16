import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';

import '../../di.dart';

class NetworkInterceptor extends Interceptor with InterceptorMixin {
  final Logger log = Logger("Dio Interceptor");
  Dio dio = di<Dio>(instanceName: "interceptor");
  late final NetworkRequestRetrier requestRetrier;

  NetworkInterceptor() {
    requestRetrier = NetworkRequestRetrier(
      dio: dio,
      internetConnectionChecker: InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 5),
        checkTimeout: const Duration(seconds: 5),
      ),
    );
  }

  String _formatRequestBody(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      } else if (data is FormData) {
        final fields = data.fields.map((e) => '${e.key}: ${e.value}').join(', ');
        final files = data.files.map((e) => '${e.key}: ${e.value.filename}').join(', ');
        return 'FormData: { fields: {$fields}, files: {$files} }';
      } else {
        return data.toString();
      }
    } catch (e) {
      return 'Could not format request body: $e';
    }
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
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: UnauthorizedException(message: err.response!.data["error"]),
        ),
      );
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