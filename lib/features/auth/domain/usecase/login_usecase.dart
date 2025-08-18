import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

class LoginUsecase {

  LoginUsecase({required this.repository});
  final AuthRepository repository;

  Future<Either<Failure, Login>> execute(LoginReqDto loginReq) async {
    return repository.login(loginReq);
  }
}
