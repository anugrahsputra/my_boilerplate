import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/core.dart';

void main() {
  group('Exceptions', () {
    test('ServerException should be an instance of Exceptions', () {
      final exception = ServerException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('NetworkException should be an instance of Exceptions', () {
      final exception = NetworkException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('UnauthorizedException should be an instance of Exceptions', () {
      final exception = UnauthorizedException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('BadRequestException should be an instance of Exceptions', () {
      final exception = BadRequestException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('ForbiddenException should be an instance of Exceptions', () {
      final exception = ForbiddenException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('NotFoundException should be an instance of Exceptions', () {
      final exception = NotFoundException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('CacheException should be an instance of Exceptions', () {
      final exception = CacheException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('CacheException should be an instance of Exceptions', () {
      final exception = CacheException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('DatabaseException should be an instance of Exceptions', () {
      final exception = DatabaseException(message: 'error');
      expect(exception, isA<Exception>());
    });

    test('UnknownException should be an instance of Exceptions', () {
      final exception = UnknownException(message: 'error');
      expect(exception, isA<Exception>());
    });
  });
}
