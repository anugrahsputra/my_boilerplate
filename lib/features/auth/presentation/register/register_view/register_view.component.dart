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
  const RegisterFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        DefaultFormField(
          controller: emailController,
          hintText: "Email",
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          onChanged: (val) =>
              context.read<RegisterBloc>().add(RegisterOnEmailChanged(val)),
        ),
        DefaultFormField(
          controller: passwordController,
          isPassword: true,
          hintText: "Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          onChanged: (val) =>
              context.read<RegisterBloc>().add(RegisterOnPasswordChanged(val)),
        ),
      ],
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.appNavigator});

  final AppNavigator appNavigator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return DefaultButton(
          onTap: ()=> context.read<RegisterBloc>().add(OnRegister()),
          child: state.isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
        );
      },
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
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: "Login",
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