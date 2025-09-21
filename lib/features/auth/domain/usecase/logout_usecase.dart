import 'package:my_boilerplate/features/auth/auth.dart';

class LogoutUsecase {
  LogoutUsecase({required this.repository});

  final AuthRepository repository;

  Future<void> call() => repository.logoutt();
}
