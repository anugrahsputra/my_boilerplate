import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  const Failure({required this.message});
  final String message;@override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message});
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({required super.message});
}

class RequestFailure extends Failure {
  const RequestFailure({required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}

class CertificateFailure extends Failure {
  const CertificateFailure({required super.message});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}