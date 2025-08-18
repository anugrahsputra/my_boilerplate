import 'package:dio/dio.dart';

abstract class NetworkClient {
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  });

  Future<Response<T>> put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    dynamic data,
  });

  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}

class NetworkClientImpl implements NetworkClient {
  NetworkClientImpl({required this.dio});
  final Dio dio;

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) {
    if (data is Map<String, dynamic>) {
      final isMultipart =
          options?.contentType == Headers.multipartFormDataContentType;
      if (isMultipart) {
        data = FormData.fromMap(data);
      }
    }

    return dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    dynamic data,
  }) {
    if (data is Map<String, dynamic>) {
      final isMultipart =
          options?.contentType == Headers.multipartFormDataContentType;
      if (isMultipart) {
        data = FormData.fromMap(data);
      }
    }

    return dio.put(
      url,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return dio.delete(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}