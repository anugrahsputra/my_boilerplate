import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/domain/failures.dart';

void main() {
  group('Failures', () {
    test('ServerFailure should be a subclass of Failure', () {
      const failure = ServerFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('UnauthorizedFailure should be a subclass of Failure', () {
      const failure = UnauthorizedFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('CacheFailure should be a subclass of Failure', () {
      const failure = CacheFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('NetworkFailure should be a subclass of Failure', () {
      const failure = NetworkFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('AuthFailure should be a subclass of Failure', () {
      const failure = AuthFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('ForbiddenFailure should be a subclass of Failure', () {
      const failure = ForbiddenFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('RequestFailure should be a subclass of Failure', () {
      const failure = RequestFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('DatabaseFailure should be a subclass of Failure', () {
      const failure = DatabaseFailure(message: 'error');
      expect(failure, isA<Failure>());
    });

    test('UnknownFailure should be a subclass of Failure', () {
      const failure = UnknownFailure(message: 'error');
      expect(failure, isA<Failure>());
    });
  });
}
