import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/core/core.dart';

import 'package:my_boilerplate/features/auth/auth.dart';

abstract class AppRoutes {
  static String get initial => AppPages.login;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppPages.login: (context) => const LoginView(),
    AppPages.register: (context) => const RegisterView(),
  };
}