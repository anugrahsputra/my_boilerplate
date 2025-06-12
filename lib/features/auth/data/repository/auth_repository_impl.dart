import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/auth/data/datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Login>> login(LoginReqDto loginReq) async {
    try {
      final result = await dataSource.login(loginReq);
      return Right(result.toLogin());
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    } on NetworkException {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    } on NotFoundException {
      return const Left(RequestFailure(message: "Not Found"));
    } on UnknownException {
      return const Left(UnknownFailure(message: "Unknown Error"));
    }
  }

  @override
  Future<Either<Failure, Register>> register(RegisterReqDto registerReq) async {
    try {
      final result = await dataSource.register(registerReq);
      return Right(result.toRegister());
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    } on NetworkException {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    } on NotFoundException {
      return const Left(RequestFailure(message: "Not Found"));
    } on UnknownException {
      return const Left(UnknownFailure(message: "Unknown Error"));
    }
  }
}