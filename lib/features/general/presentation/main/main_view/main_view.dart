import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/app_cubit.dart';
import '../../../../../core/core.dart';
import '../../../../../di.dart';

part 'main_view.component.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final appCubit = di<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => appCubit)],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppStatus>(
            listener: (context, state) {
              if (state == AppStatus.unauthenticated) {
                di<AppNavigator>().goToSplash(context);
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Main View"),
            actions: [TextButton(onPressed: () => appCubit.logout(), child: Text("Logout"))],
          ),
        ),
      ),
    );
  }
}