import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/general/general.dart';

abstract class AppRoutes {
  static String get initial => AppPages.splash;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppPages.splash: (context) => const AppSplash(),
    AppPages.login: (context) => const LoginView(),
    AppPages.register: (context) => const RegisterView(),

    AppPages.main: (context) => const MainView(),
  };
}
