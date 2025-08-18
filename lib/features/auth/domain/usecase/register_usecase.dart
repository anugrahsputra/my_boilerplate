import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

class RegisterUsecase {

  RegisterUsecase({required this.repository});
  final AuthRepository repository;

  Future<Either<Failure, Register>> execute(RegisterReqDto registerReq) async {
    return repository.register(registerReq);
  }
}
