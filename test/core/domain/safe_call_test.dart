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
        expect(result, Right('success'));
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

      test(
        'should return Left with UnknownFailure when function throws unknown exception',
        () async {
          // arrange
          Future<String> unknownErrorFunction() async {
            await Future.delayed(const Duration(milliseconds: 10));
            throw Exception('Unknown error');
          }

          // act
          final result = await safeCall(unknownErrorFunction);

          // assert
          expect(result.isLeft(), true);
          expect(
            result.fold(
              (failure) => failure is UnknownFailure,
              (success) => false,
            ),
            true,
          );
          expect(
            result.fold((failure) => failure.message, (success) => ''),
            'Exception: Unknown error',
          );
        },
      );

      test(
        'should return Left with UnknownFailure when function throws generic Exception',
        () async {
          // arrange
          Future<String> genericErrorFunction() async {
            await Future.delayed(const Duration(milliseconds: 10));
            throw Exception('Generic error');
          }

          // act
          final result = await safeCall(genericErrorFunction);

          // assert
          expect(result.isLeft(), true);
          expect(
            result.fold(
              (failure) => failure is UnknownFailure,
              (success) => false,
            ),
            true,
          );
          expect(
            result.fold((failure) => failure.message, (success) => ''),
            'Exception: Generic error',
          );
        },
      );
    });
  });
}
