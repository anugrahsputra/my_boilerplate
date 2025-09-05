import 'package:flutter/material.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/general/general.dart';

/// App routes
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

  /// Common method for building custom page transitions
  static PageRouteBuilder<dynamic> _buildPageRoute({
    required Widget page,
    RouteSettings? settings,
    Offset begin = const Offset(0, 1), // Slide from bottom by default
    Curve curve = Curves.easeInOut,
    bool fullscreenDialog = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder(
      settings: settings,
      fullscreenDialog: fullscreenDialog,
      pageBuilder: (_, _, _) => page,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, _, child) {
        final tween = Tween(
          begin: begin,
          end: Offset.zero,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// onGenerateRoute: Handle navigation with custom transitions
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splash:
        return _buildPageRoute(
          page: const AppSplash(),
          settings: settings,
        );

      case AppPages.login:
        return _buildPageRoute(
          page: const LoginView(),
          settings: settings,
          begin: const Offset(1, 0), // Slide from right
        );

      case AppPages.register:
        return _buildPageRoute(
          page: const RegisterView(),
          settings: settings,
          begin: const Offset(1, 0), // Slide from right
        );

      case AppPages.main:
        return _buildPageRoute(
          page: const MainView(),
          settings: settings,
          fullscreenDialog: true, // Modal-style on iOS
        );

      default:
        return _buildPageRoute(
          page: const Scaffold(
            body: Center(
              child: Text(
                '404 - Page Not Found',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          settings: settings,
        );
    }
  }
}
