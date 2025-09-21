import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/l10n/l10n.dart';

part 'register_view.component.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterBloc registerBloc = di<RegisterBloc>();
  final AppNavigator appNavigator = di<AppNavigator>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                behavior: SnackBarBehavior.floating,
              ),
            );

            context.read<RegisterBloc>().add(const RegisterOnError());
          } else if (state.status == FormzSubmissionStatus.success) {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                content: Text(context.l10n.registerSuccess),
                behavior: SnackBarBehavior.floating,
              ),
            );
            appNavigator.back(context);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const RegisterHeader(),
                      SizedBox(height: 80.h),
                      const RegisterFields(),
                      const SizedBox(height: 16),
                      const RegisterButton(),
                    ]),
                  ),
                ),

                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Column(
                    children: [
                      const Spacer(),
                      RegisterFooter(navigator: appNavigator),
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
