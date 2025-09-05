import 'dart:io';

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

  /// Reusable PageRouteBuilder with multiple transitions
  static PageRouteBuilder<dynamic> buildPageRoute({
    required Widget page,
    RouteSettings? settings,
    AppTransition transition = AppTransition.slideRight,
    bool fullscreenDialog = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder(
      settings: settings,
      fullscreenDialog: fullscreenDialog,
      transitionDuration: duration,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        switch (transition) {
          case AppTransition.slideRight:
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );

          case AppTransition.slideLeft:
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );

          case AppTransition.slideUp:
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );

          case AppTransition.slideDown:
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );

          case AppTransition.fade:
            return FadeTransition(
              opacity: animation,
              child: child,
            );

          case AppTransition.scale:
            return ScaleTransition(
              scale: animation.drive(
                Tween(
                  begin: 0.8,
                  end: 1.0,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );

          case AppTransition.none:
            return child;
        }
      },
    );
  }

  /// onGenerateRoute: Handle navigation with custom transitions
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splash:
        return buildPageRoute(
          page: const AppSplash(),
          settings: settings,
          transition: AppTransition.fade,
        );

      case AppPages.login:
        return buildPageRoute(
          page: const LoginView(),
          settings: settings,
          transition: AppTransition.slideRight,
        );

      case AppPages.register:
        return buildPageRoute(
          page: const RegisterView(),
          settings: settings,
          transition: AppTransition.slideRight,
        );

      case AppPages.main:
        return buildPageRoute(
          page: const MainView(),
          settings: settings,
          fullscreenDialog: Platform.isIOS, // iOS uses modal-style
          transition: Platform.isIOS
              ? AppTransition.slideUp
              : AppTransition.fade,
        );

      default:
        return buildPageRoute(
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
