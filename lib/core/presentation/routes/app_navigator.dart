import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/general/general.dart';

class AppNavigator {
  final Logger log = Logger('AppNavigator');

  bool canPop(BuildContext context) => Navigator.of(context).canPop();

  bool isCurrentPage(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent ?? false;
  }

  bool canNavigate(BuildContext context) {
    if (context.mounted) {
      return true;
    } else {
      log.warning('Cannot navigate because the context is unmounted');
      return false;
    }
  }

  /// Go back
  void back<T>(BuildContext context, [T? result]) {
    if (canPop(context)) {
      Navigator.of(context).pop(result);
    }
  }

  /// Push route with custom transition
  void push(
    BuildContext context,
    Widget page, {
    AppTransition transition = AppTransition.slideRight,
    bool fullscreenDialog = false,
    Object? arguments,
  }) {
    if (!canNavigate(context)) return;

    Navigator.of(context).push(
      Platform.isAndroid
          ? AppRoutes.buildMaterialPageRoute(
              page: page,
              settings: RouteSettings(arguments: arguments),
              transition: transition,
              fullscreenDialog: fullscreenDialog,
            )
          : AppRoutes.buildCupertinoPageRoute(
              page: page,
              settings: RouteSettings(arguments: arguments),
              transition: transition,
              fullscreenDialog: fullscreenDialog,
            ),
    );
  }

  /// Push and remove all previous routes
  void pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    AppTransition transition = AppTransition.slideRight,
    bool fullscreenDialog = false,
    Object? arguments,
  }) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushAndRemoveUntil(
      Platform.isAndroid
          ? AppRoutes.buildMaterialPageRoute(
              page: page,
              settings: RouteSettings(arguments: arguments),
              transition: transition,
              fullscreenDialog: fullscreenDialog,
            )
          : AppRoutes.buildCupertinoPageRoute(
              page: page,
              settings: RouteSettings(arguments: arguments),
              transition: transition,
              fullscreenDialog: fullscreenDialog,
            ),
      (route) => false,
    );
  }

  /// Push named route
  void pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  /// Push named route and clear history
  void pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /* === Specific GoTo Methods === */

  void goToSplash(
    BuildContext context, {
    AppTransition transition = AppTransition.fade,
  }) {
    pushAndRemoveUntil(
      context,
      const AppSplash(),
      transition: transition,
    );
  }

  void goToLogin(
    BuildContext context, {
    AppTransition transition = AppTransition.slideRight,
  }) {
    pushAndRemoveUntil(
      context,
      const LoginView(),
      transition: transition,
    );
  }

  void goToRegister(
    BuildContext context, {
    AppTransition transition = AppTransition.slideRight,
  }) {
    push(
      context,
      const RegisterView(),
      transition: transition,
    );
  }

  void goToMain(
    BuildContext context, {
    AppTransition transition = AppTransition.slideUp,
  }) {
    pushAndRemoveUntil(
      context,
      const MainView(),
      transition: transition,
      fullscreenDialog: true,
    );
  }
}
