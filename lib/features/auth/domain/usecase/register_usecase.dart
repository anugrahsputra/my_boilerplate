import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});

  Future<Either<Failure, Register>> execute(RegisterReqDto registerReq) async {
    return await repository.register(registerReq);
  }
}