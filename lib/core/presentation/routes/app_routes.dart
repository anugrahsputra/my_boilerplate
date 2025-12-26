import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/general/general.dart';

/// AppRoutes
abstract class AppRoutes {
  /// Initial route
  static String get initial => AppPages.splash;

  /// All registered routes for Navigator.pushNamed
  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppPages.splash: (context) => const AppSplash(),
    AppPages.login: (context) => const LoginView(),
    AppPages.register: (context) => const RegisterView(),
    AppPages.main: (context) => const MainView(),
  };

  static MaterialPageRoute<T> buildMaterialPageRoute<T>({
    required Widget page,
    RouteSettings? settings,
    AppTransition transition = .slideRight,
    bool fullscreenDialog = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return MaterialPageRoute<T>(
      builder: (_) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }

  /// Reusable PageRouteBuilder with multiple transitions
  static CupertinoPageRoute<T> buildCupertinoPageRoute<T>({
    required Widget page,
    RouteSettings? settings,
    AppTransition transition = AppTransition.slideRight,
    bool fullscreenDialog = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CupertinoPageRoute<T>(
      builder: (_) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }

  /// onGenerateRoute: Handle navigation with custom transitions
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splash:
        return Platform.isAndroid
            ? buildMaterialPageRoute(
                page: const AppSplash(),
                settings: settings,
                transition: AppTransition.fade,
              )
            : buildCupertinoPageRoute(
                page: const AppSplash(),
                settings: settings,
                transition: AppTransition.fade,
              );

      case AppPages.login:
        return Platform.isAndroid
            ? buildMaterialPageRoute(
                page: const LoginView(),
                settings: settings,
                transition: AppTransition.slideRight,
              )
            : buildCupertinoPageRoute(
                page: const LoginView(),
                settings: settings,
                transition: AppTransition.slideRight,
              );
      case AppPages.register:
        return Platform.isAndroid
            ? buildMaterialPageRoute(
                page: const RegisterView(),
                settings: settings,
                transition: AppTransition.slideRight,
              )
            : buildCupertinoPageRoute(
                page: const RegisterView(),
                settings: settings,
                transition: AppTransition.slideRight,
              );

      case AppPages.main:
        return Platform.isAndroid
            ? buildMaterialPageRoute(
                page: const MainView(),
                settings: settings,
                fullscreenDialog: Platform.isIOS, // iOS uses modal-style
                transition: Platform.isIOS
                    ? AppTransition.slideUp
                    : AppTransition.fade,
              )
            : buildCupertinoPageRoute(
                page: const MainView(),
                settings: settings,
                fullscreenDialog: Platform.isIOS, // iOS uses modal-style
                transition: Platform.isIOS
                    ? AppTransition.slideUp
                    : AppTransition.fade,
              );

      default:
        return Platform.isAndroid
            ? buildMaterialPageRoute(
                page: const Scaffold(
                  body: Center(
                    child: Text(
                      '404 - Page Not Found',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                settings: settings,
                transition: AppTransition.fade,
              )
            : buildCupertinoPageRoute(
                page: const Scaffold(
                  body: Center(
                    child: Text(
                      '404 - Page Not Found',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                settings: settings,
                transition: AppTransition.fade,
              );
    }
  }
}
