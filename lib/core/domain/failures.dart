import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.failure({required String message}) = _Failure;

  const factory Failure.serverFailure({required String message}) =
      ServerFailure;

  const factory Failure.unauthorizeFailure({required String message}) =
      UnauthorizedFailure;

  const factory Failure.cacheFailure({required String message}) = CacheFailure;

  const factory Failure.networkFailure({required String message}) =
      NetworkFailure;

  const factory Failure.forbidden({required String message}) = ForbiddenFailure;

  const factory Failure.requestFailure({required String message}) =
      RequestFailure;

  const factory Failure.databaseFailre({required String message}) =
      DatabaseFailure;

  const factory Failure.authFailure({required String message}) = AuthFailure;

  const factory Failure.certificateFailure({required String message}) =
      CertificateFailure;
}
