import 'package:my_boilerplate/features/auth/auth.dart';

extension RegisterMapper on RegisterRespDto {
  Register toRegister() {
    return Register(id: id, token: token);
  }
}