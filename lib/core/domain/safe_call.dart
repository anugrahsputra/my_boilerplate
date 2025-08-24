import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:my_boilerplate/core/core.dart';

/// Executes a given asynchronous function safely, capturing and mapping exceptions
/// to corresponding [Failure] types wrapped in an [Either].
///
/// This function is intended to standardize error handling for asynchronous calls,
/// especially those involving network or database operations. It catches specific
/// exceptions and returns a [Left] containing a relevant [Failure] subclass, or a
/// [Right] containing the successful result.
///
/// The following exceptions are handled:
/// - [DioException]: Maps various custom error types (e.g., [UnauthorizedException],
///   [BadRequestException], [ServerException], etc.) to their respective [Failure] types.
/// - [CacheException]: Returns a [CacheFailure].
/// - [DatabaseException]: Returns a [DatabaseFailure].
/// - [UnknownException]: Returns an [UnknownFailure].
/// - Any other exception: Returns an [UnknownFailure] with the exception's string representation.
///
/// Type parameter:
/// - [T]: The type of the successful result.
///
/// Parameters:
/// - [call]: A function that returns a [Future] of type [T].
///
/// Returns:
/// - A [Future] containing an [Either] with a [Failure] on the left or a value of type [T] on the right.
Future<Either<Failure, T>> safeCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (e) {
    final error = e.error;

    if (error is UnauthorizedException) {
      return Left(UnauthorizedFailure(message: error.message));
    } else if (error is BadRequestException) {
      return Left(RequestFailure(message: error.message));
    } else if (error is ServerException) {
      return Left(ServerFailure(message: error.message));
    } else if (error is NetworkException) {
      return Left(NetworkFailure(message: error.message));
    } else if (error is ForbiddenException) {
      return Left(ForbiddenFailure(message: error.message));
    } else if (error is NotFoundException) {
      return Left(RequestFailure(message: error.message));
    } else if (error is AuthFailure) {
      return Left(AuthFailure(message: error.message));
    } else if (error is CertificateException) {
      return Left(CertificateFailure(message: error.message));
    } else if (error is CertificateCouldNotBeVerifiedException) {
      return Left(CertificateFailure(message: error.toString()));
    } else if (error is CertificateNotVerifiedException) {
      return Left(CertificateFailure(message: error.toString()));
    } else {
      return const Left(Failure.failure(message: 'Unknown Dio error'));
    }
  } on CacheException catch (e) {
    return Left(CacheFailure(message: e.message));
  } on DatabaseException catch (e) {
    return Left(DatabaseFailure(message: e.message));
  } on UnknownException catch (e) {
    return Left(Failure.failure(message: e.message));
  }
}
