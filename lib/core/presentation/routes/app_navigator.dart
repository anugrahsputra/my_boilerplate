import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../core.dart';

class AppNavigator {
  final Logger log = Logger("App Navigator");

  bool canPop(BuildContext context) => Navigator.of(context).canPop();

  bool isCurrentPage(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent == true;
  }

  bool canNavigate(BuildContext context) {
    if (context.mounted) {
      return true;
    } else {
      log.warning("Cannot navigate because the context is unmounted");
      return false;
    }
  }

  void back<T>(BuildContext context, [T? result]) {
    if (canPop(context)) {
      Navigator.of(context).pop(result);
    }
  }

  void pushNamed(BuildContext context, String routeName, {Object? arguments}) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

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

  void goToSplash(BuildContext context) {
    if(!canNavigate(context))  return;

    pushNamedAndRemoveUntil(context, AppPages.splash);
  }

  void goToLogin(BuildContext context) {
   if(!canNavigate(context))  return;

   pushNamedAndRemoveUntil(context, AppPages.login);
  }

  void goToRegister(BuildContext context) {
    if(!canNavigate(context))  return;

    pushNamed(context, AppPages.register);
  }

  void goToMain(BuildContext context) {
    if(!canNavigate(context)) return;

    pushNamedAndRemoveUntil(context, AppPages.main);
  }
}