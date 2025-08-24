import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/core.dart';

void main() {
  group('SafeCall', () {
    group('call', () {
      test('should return Right with result when function succeeds', () async {
        // arrange
        Future<String> successFunction() async {
          await Future.delayed(const Duration(milliseconds: 10));
          return 'success';
        }

        // act
        final result = await safeCall(successFunction);

        // assert
        expect(result, const Right('success'));
      });

      test(
        'should return Left with CacheFailure when function throws CacheException',
        () async {
          // arrange
          Future<String> cacheErrorFunction() async {
            await Future.delayed(const Duration(milliseconds: 10));
            throw CacheException(message: 'Cache error');
          }

          // act
          final result = await safeCall(cacheErrorFunction);

          // assert
          expect(result.isLeft(), true);
          expect(
            result.fold(
              (failure) => failure is CacheFailure,
              (success) => false,
            ),
            true,
          );
          expect(
            result.fold((failure) => failure.message, (success) => ''),
            'Cache error',
          );
        },
      );
    });
  });
}
