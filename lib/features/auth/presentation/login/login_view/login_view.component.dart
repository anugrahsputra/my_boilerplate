part of 'login_view.dart';

class AppIconHeader extends StatelessWidget {
  const AppIconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconPath.appIcon, width: 80.w),
          Text(
            'Login',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),

          const Text(
            'Please Login to contiue using the app',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((LoginBloc bloc) => bloc.state);

    return Column(
      spacing: 16.h,
      children: [
        DefaultFormField(
          initialValue: state.email.value,
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginEvent.onEmailChanged(value)),
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          errorText:
              (state.hasSubmitted || !state.email.isPure) &&
                  state.email.isNotValid
              ? 'Email tidak valid'
              : null,
        ),
        DefaultFormField(
          initialValue: state.password.value,
          onChanged: (value) => context.read<LoginBloc>().add(
            LoginEvent.onPasswordChanged(value),
          ),
          isPassword: true,
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          errorText:
              (state.hasSubmitted || !state.password.isPure) &&
                  state.password.isNotValid
              ? 'Password kosong'
              : null,
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    final isButtonEnabled =
        state.isValid && state.status != FormzSubmissionStatus.inProgress;
    return DefaultButton(
      isEnabled: isButtonEnabled,
      onTap: isButtonEnabled
          ? () => context.read<LoginBloc>().add(const LoginEvent.onLogin())
          : null,
      child: state.status == FormzSubmissionStatus.inProgress
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({required this.navigator, super.key});

  final AppNavigator navigator;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80.h,
      width: 1.sw,
      padding: EdgeInsets.all(16.w),
      child: RichText(
        text: TextSpan(
          text: "Don't have account? ",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigator.goToRegister(context),
            ),
          ],
        ),
      ),
    );
  }
}
