import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/auth/data/datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Login>> login(LoginReqDto loginReq) async {
    return safeCall(() async {
      final result = await dataSource.login(loginReq);
      return result.toLogin();
    });
  }

  @override
  Future<Either<Failure, Register>> register(RegisterReqDto registerReq) async {
    return safeCall(() async {
      final result = await dataSource.register(registerReq);
      return result.toRegister();
    });
  }
}