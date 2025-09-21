part of 'register_view.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.l10n;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconPath.appIcon, width: 80.w),
        Text(
          local.registerTitle,
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),

        Text(
          local.registerSubtitle,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((RegisterBloc bloc) => bloc.state);

    return Column(
      spacing: 16.h,
      children: [
        DefaultFormField(
          initialValue: state.name.value,

          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterOnNameChanged(value)),
          hintText: context.l10n.fullNameHint,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
          errorText:
              (state.hasSubmitted || !state.name.isPure) &&
                  state.name.isNotValid
              ? (state.name.error == NameValidationError.tooShort
                    ? context.l10n.nameTooShortError
                    : context.l10n.nameEmptyError)
              : null,
        ),
        DefaultFormField(
          initialValue: state.phoneNumber.value,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterOnPhoneChanged(value)),
          hintText: context.l10n.phoneNumberHint,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone),
          errorText:
              (state.hasSubmitted || !state.phoneNumber.isPure) &&
                  state.phoneNumber.isNotValid
              ? context.l10n.phoneNumberInvalidError
              : null,
        ),
        DefaultFormField(
          initialValue: state.email.value,
          onChanged: (value) =>
              context.read<RegisterBloc>().add(RegisterOnEmailChanged(value)),
          hintText: context.l10n.emailHint,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          errorText:
              (state.hasSubmitted || !state.email.isPure) &&
                  state.email.isNotValid
              ? context.l10n.emailInvalidError
              : null,
        ),
        DefaultFormField(
          initialValue: state.password.value,
          onChanged: (value) => context.read<RegisterBloc>().add(
            RegisterOnPasswordChanged(value),
          ),
          isPassword: true,
          hintText: context.l10n.passwordHint,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    final isButtonEnabled =
        state.isValid && state.status != FormzSubmissionStatus.inProgress;
    return DefaultButton(
      isEnabled: isButtonEnabled,
      onTap: isButtonEnabled
          ? () => context.read<RegisterBloc>().add(const OnRegister())
          : null,
      child: state.status == FormzSubmissionStatus.inProgress
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(
              context.l10n.registerButton,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({required this.navigator, super.key});

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
          text: context.l10n.alreadyHaveAccount,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: context.l10n.loginButton,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigator.back(context),
            ),
          ],
        ),
      ),
    );
  }
}
