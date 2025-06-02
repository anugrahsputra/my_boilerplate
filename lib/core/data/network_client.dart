import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  });
  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  });
  Future<Response> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
  Future<Response> delete(String url, {Map<String, dynamic>? queryParameters});
}

class NetworkClientImpl implements NetworkClient {
  final Dio dio;

  NetworkClientImpl({required this.dio});

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    return dio.post(
      url,
      queryParameters: queryParameters,
      data: FormData.fromMap(data),
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<Response> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
  }) async {
    return dio.put(url, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.delete(url, queryParameters: queryParameters);
  }
}