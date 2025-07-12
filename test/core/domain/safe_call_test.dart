import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/core.dart';

void main() {
  group('safeCall', () {
    test('should return Right with the result when the call is successful', () async {
      final result = await safeCall(() async => 'success');
      expect(result, const Right('success'));
    });

    test('should return Left with UnauthorizedFailure on UnauthorizedException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: UnauthorizedException(message: 'unauthorized'),
        ),
      );
      expect(result, const Left(UnauthorizedFailure(message: 'unauthorized')));
    });

    test('should return Left with RequestFailure on BadRequestException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: BadRequestException(message: 'bad request'),
        ),
      );
      expect(result, const Left(RequestFailure(message: 'bad request')));
    });

    test('should return Left with ServerFailure on ServerException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: ServerException(message: 'server error'),
        ),
      );
      expect(result, const Left(ServerFailure(message: 'server error')));
    });

    test('should return Left with NetworkFailure on NetworkException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: NetworkException(message: 'network error'),
        ),
      );
      expect(result, const Left(NetworkFailure(message: 'network error')));
    });

    test('should return Left with ForbiddenFailure on ForbiddenException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: ForbiddenException(message: 'forbidden'),
        ),
      );
      expect(result, const Left(ForbiddenFailure(message: 'forbidden')));
    });

    test('should return Left with RequestFailure on NotFoundException', () async {
      final result = await safeCall<String>(
        () async => throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: NotFoundException(message: 'not found'),
        ),
      );
      expect(result, const Left(RequestFailure(message: 'not found')));
    });

    test('should return Left with CacheFailure on CacheException', () async {
      final result = await safeCall<String>(
        () async => throw CacheException(message: 'cache error'),
      );
      expect(result, const Left(CacheFailure(message: 'cache error')));
    });

    test('should return Left with DatabaseFailure on DatabaseException', () async {
      final result = await safeCall<String>(
        () async => throw DatabaseException(message: 'database error'),
      );
      expect(result, const Left(DatabaseFailure(message: 'database error')));
    });

    test('should return Left with UnknownFailure on UnknownException', () async {
      final result = await safeCall<String>(
        () async => throw UnknownException(message: 'unknown error'),
      );
      expect(result, const Left(UnknownFailure(message: 'unknown error')));
    });

    test('should return Left with UnknownFailure on other exceptions', () async {
      final result = await safeCall<String>(
        () async => throw Exception('some error'),
      );
      expect(result, const Left(UnknownFailure(message: 'Exception: some error')));
    });
  });
}
