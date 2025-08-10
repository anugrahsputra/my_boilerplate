import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';

import '../../helper/mock.dart';

void main() {
  late MockDio mockDio;
  late NetworkClientImpl networkClient;

  setUp(() {
    mockDio = MockDio();
    networkClient = NetworkClientImpl(dio: mockDio);
  });

  group('NetworkClientImpl', () {
    test('get should call dio.get with correct parameters', () async {
      when(
        mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
          cancelToken: anyNamed('cancelToken'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        ),
      ).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: '')),
      );

      await networkClient.get('test_url');

      verify(mockDio.get('test_url')).called(1);
    });

    test('post should call dio.post with correct parameters', () async {
      when(
        mockDio.post(
          any,
          queryParameters: anyNamed('queryParameters'),
          data: anyNamed('data'),
          options: anyNamed('options'),
          cancelToken: anyNamed('cancelToken'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
          onSendProgress: anyNamed('onSendProgress'),
        ),
      ).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: '')),
      );

      await networkClient.post('test_url', data: {'key': 'value'});

      verify(mockDio.post('test_url', data: {'key': 'value'})).called(1);
    });

    test('put should call dio.put with correct parameters', () async {
      when(
        mockDio.put(
          any,
          queryParameters: anyNamed('queryParameters'),
          data: anyNamed('data'),
          options: anyNamed('options'),
        ),
      ).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: '')),
      );

      await networkClient.put('test_url', data: {'key': 'value'});

      verify(mockDio.put('test_url', data: {'key': 'value'})).called(1);
    });

    test('delete should call dio.delete with correct parameters', () async {
      when(
        mockDio.delete(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
          cancelToken: anyNamed('cancelToken'),
        ),
      ).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: '')),
      );

      await networkClient.delete('test_url');

      verify(mockDio.delete('test_url')).called(1);
    });
  });

  group('NetworkClientParsed', () {
    late MockNetworkClient mockNetworkClient;

    setUp(() {
      mockNetworkClient = MockNetworkClient();
    });

    test('getParsed should return parsed data', () async {
      when(mockNetworkClient.get(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'key': 'value'},
        ),
      );

      final result = await mockNetworkClient.getParsed(
        'test_url',
        converter: (json) => json['key'],
      );

      expect(result, 'value');
    });

    test('postParsed should return parsed data', () async {
      when(mockNetworkClient.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'key': 'value'},
        ),
      );

      final result = await mockNetworkClient.postParsed(
        'test_url',
        converter: (json) => json['key'],
        data: {},
      );

      expect(result, 'value');
    });
  });
}
