part of 'register_view.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconPath.appIcon, width: 80.w),
        Text(
          "Register",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),

        Text(
          "Please Sign Up to contiue using the app",
          style: TextStyle(fontWeight: FontWeight.w500),
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

          onChanged: (value) => context.read<RegisterBloc>().add(RegisterOnNameChanged(value)),
          hintText: "Full Name",
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
          errorText: (state.hasSubmitted || !state.name.isPure) && state.name.isNotValid
              ? (state.name.error == NameValidationError.tooShort
                    ? 'Nama terlalu pendek'
                    : 'Nama tidak boleh kosong')
              : null,
        ),
        DefaultFormField(
          initialValue: state.phoneNumber.value,
          onChanged: (value) => context.read<RegisterBloc>().add(RegisterOnPhoneChanged(value)),
          hintText: "Phone Number",
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone),
          errorText:
              (state.hasSubmitted || !state.phoneNumber.isPure) && state.phoneNumber.isNotValid
              ? 'Nomor HP tidak valid'
              : null,
        ),
        DefaultFormField(
          initialValue: state.email.value,
          onChanged: (value) => context.read<RegisterBloc>().add(RegisterOnEmailChanged(value)),
          hintText: "Email",
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          errorText: (state.hasSubmitted || !state.email.isPure) && state.email.isNotValid
              ? 'Email tidak valid'
              : null,
        ),
        DefaultFormField(
          initialValue: state.password.value,
          onChanged: (value) => context.read<RegisterBloc>().add(RegisterOnPasswordChanged(value)),
          isPassword: true,
          hintText: "Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          errorText: (state.hasSubmitted || !state.password.isPure) && state.password.isNotValid
              ? 'Password tidak boleh kosong'
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
    final isButtonEnabled = (state.isValid && state.status != FormzSubmissionStatus.inProgress);
    return DefaultButton(
      isEnabled: isButtonEnabled,
      onTap: isButtonEnabled ? () => context.read<RegisterBloc>().add(const OnRegister()) : null,
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
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key, required this.navigator});

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
          text: "Already have an account? ",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16.sp),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => navigator.back(context),
            ),
          ],
        ),
      ),
    );
  }
}