import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/domain/failures.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginReqDto loginReq);

  Future<Either<Failure, Register>> register(RegisterReqDto registerReq);
}
