import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/domain/failures.dart';

void main() {
  group('Failures', () {
    test('ServerFailure should be a subclass of Failure', () {
      const failure = Failure.serverFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('UnauthorizedFailure should be a subclass of Failure', () {
      const failure = Failure.unauthorizeFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('CacheFailure should be a subclass of Failure', () {
      const failure = Failure.cacheFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('NetworkFailure should be a subclass of Failure', () {
      const failure = Failure.networkFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('AuthFailure should be a subclass of Failure', () {
      const failure = Failure.authFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('ForbiddenFailure should be a subclass of Failure', () {
      const failure = Failure.forbidden(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('RequestFailure should be a subclass of Failure', () {
      const failure = Failure.requestFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('DatabaseFailure should be a subclass of Failure', () {
      const failure = Failure.databaseFailre(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('UnknownFailure should be a subclass of Failure', () {
      const failure = Failure.failure(message: 'error');
      expect(failure, isA<Failure>());
    });
  });
}
