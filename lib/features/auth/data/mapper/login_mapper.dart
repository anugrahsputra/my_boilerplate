import 'package:my_boilerplate/features/auth/auth.dart';

extension LoginMapper on LoginRespDto {
  Login toLogin() {
    return Login(token: token);
  }
}
