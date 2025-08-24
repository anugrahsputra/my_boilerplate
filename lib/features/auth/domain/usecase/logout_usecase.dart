import 'package:dartz/dartz.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

class LogoutUsecase {
  LogoutUsecase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, Unit>> call() => repository.logout();
}
