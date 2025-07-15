import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';
import '../di.dart';
import 'app_cubit.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({super.key});

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  final appNavigator = di<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AppCubit>(),
      child: BlocListener<AppCubit, AppStatus>(
        listener: (context, state) {
          if (state == AppStatus.authenticated) {
            appNavigator.goToMain(context);
          } else if (state == AppStatus.unauthenticated) {
            appNavigator.goToLogin(context);
          }
        },

        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}