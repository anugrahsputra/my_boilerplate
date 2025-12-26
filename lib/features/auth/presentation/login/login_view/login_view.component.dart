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
            context.l10n.loginTitle,
            style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
            textAlign: .center,
          ),

          Text(
            context.l10n.loginSubtitle,
            style: const TextStyle(fontWeight: .w500),
            textAlign: .center,
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
          hintText: context.l10n.emailHint,
          keyboardType: .emailAddress,
          prefixIcon: const Icon(Icons.email),
          inputAction: .next,
          errorText:
              (state.hasSubmitted || !state.email.isPure) &&
                  state.email.isNotValid
              ? context.l10n.emailInvalidError
              : null,
        ),
        DefaultFormField(
          initialValue: state.password.value,
          onChanged: (value) => context.read<LoginBloc>().add(
            LoginEvent.onPasswordChanged(value),
          ),
          isPassword: true,
          hintText: context.l10n.passwordHint,
          keyboardType: .visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          onSubmit: (value) =>
              context.read<LoginBloc>().add(const LoginEvent.onLogin()),
          errorText:
              (state.hasSubmitted || !state.password.isPure) &&
                  state.password.isNotValid
              ? context.l10n.passwordEmptyError
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
    final isButtonEnabled = state.isValid && state.status != .inProgress;
    return DefaultButton(
      isEnabled: isButtonEnabled,
      onTap: isButtonEnabled
          ? () => context.read<LoginBloc>().add(const LoginEvent.onLogin())
          : null,
      child: state.status == .inProgress
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(
              context.l10n.loginButton,
              style: TextStyle(
                fontWeight: .w600,
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
      alignment: .center,
      height: 80.h,
      width: 1.sw,
      padding: .all(16.w),
      child: RichText(
        text: TextSpan(
          text: context.l10n.dontHaveAccount,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: context.l10n.registerButton,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: .bold,
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
