import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';

import '../../helper/mock.dart';

class TestInterceptor extends Interceptor with InterceptorMixin {}

void main() {
  group('InterceptorMixin', () {
    late TestInterceptor interceptor;

    setUp(() {
      interceptor = TestInterceptor();
    });

    test('isBadRequest should return true for status code 400', () {
      final error = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 400,
        ),
      );
      expect(interceptor.isBadRequest(error), isTrue);
    });

    test('isUnauthorized should return true for status code 401', () {
      final error = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 401,
        ),
      );
      expect(interceptor.isUnauthorized(error), isTrue);
    });

    test('isForbidden should return true for status code 403', () {
      final error = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 403,
        ),
      );
      expect(interceptor.isForbidden(error), isTrue);
    });

    test('isNotFound should return true for status code 404', () {
      final error = DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 404,
        ),
      );
      expect(interceptor.isNotFound(error), isTrue);
    });

    test('isConnectionError should return true for connection error', () {
      final error = DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionError,
      );
      expect(interceptor.isConnectionError(error), isTrue);
    });

    test('isUnknownError should return true for unknown error', () {
      final error = DioException(
        requestOptions: RequestOptions(),
      );
      expect(interceptor.isUnknownError(error), isTrue);
    });
  });

  group('NetworkRequestRetrier', () {
    late MockDio mockDio;
    late MockInternetConnectionChecker mockInternetConnectionChecker;
    late NetworkRequestRetrier requestRetrier;

    setUp(() {
      mockDio = MockDio();
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      requestRetrier = NetworkRequestRetrier(
        dio: mockDio,
        internetConnectionChecker: mockInternetConnectionChecker,
      );
    });

    test('retryRequest should complete when connection is restored', () async {
      final requestOptions = RequestOptions(path: 'test_path');
      when(mockInternetConnectionChecker.onStatusChange).thenAnswer(
        (_) => Stream.fromIterable([InternetConnectionStatus.connected]),
      );
      when(
        mockDio.request(
          any,
          cancelToken: anyNamed('cancelToken'),
          data: anyNamed('data'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
          onSendProgress: anyNamed('onSendProgress'),
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
        ),
      ).thenAnswer((_) async => Response(requestOptions: requestOptions));

      final response = await requestRetrier.retryRequest(requestOptions);

      expect(response, isA<Response>());
    });
  });
}
