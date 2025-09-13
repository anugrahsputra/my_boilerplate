import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/app/app_cubit.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({super.key});

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  final AppNavigator appNavigator = di<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AppCubit>(),
      child: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: () => appNavigator.goToMain(context),
            unauthenticated: () => appNavigator.goToLogin(context),
          );
        },

        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
