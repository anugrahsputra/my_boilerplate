import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/l10n/l10n.dart';

part 'login_view.component.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AppNavigator appNavigator = di<AppNavigator>();
  final LoginBloc loginBloc = di<LoginBloc>();
  final Logger log = Logger('Login View');

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<LoginBloc>().add(const LoginOnError());
          } else if (state.status == FormzSubmissionStatus.success) {
            appNavigator.goToMain(context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: CustomScrollView(
              keyboardDismissBehavior: .onDrag,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const AppIconHeader(),
                      SizedBox(height: 80.h),
                      const LoginFields(),
                      const SizedBox(height: 16),
                      const LoginButton(),
                    ]),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Column(
                    children: [
                      const Spacer(),
                      LoginFooter(navigator: appNavigator),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
