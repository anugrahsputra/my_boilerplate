import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/auth/data/datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final LocalStorageManager localStorageManager;
  final Logger log = Logger("Auth Repository");

  AuthRepositoryImpl({required this.dataSource, required this.localStorageManager});

  @override
  Future<Either<Failure, Login>> login(LoginReqDto loginReq) async {
    final result = await dataSource.login(loginReq);
    return result.fold((failure) => Left(failure), (data) {
      localStorageManager.writeToStorage("token", data.token);
      return Right(data.toLogin());
    });
  }

  @override
  Future<Either<Failure, Register>> register(RegisterReqDto registerReq) async {
    final result = await dataSource.register(registerReq);
    return result.fold((failure) => Left(failure), (data) => Right(data.toRegister()));
  }
}