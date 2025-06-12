import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<Either<Failure, Login>> execute(LoginReqDto loginReq) async {
    return await repository.login(loginReq);
  }
}