part of 'login_view.dart';

class AppIconHeader extends StatelessWidget {
  const AppIconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconPath.appIcon, width: 110.w),
          Text(
            "Downormal",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({
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
              context.read<LoginBloc>().add(OnEmailChanged(val)),
        ),
        DefaultFormField(
          controller: passwordController,
          isPassword: true,
          hintText: "Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          onChanged: (val) =>
              context.read<LoginBloc>().add(OnPasswordChanged(val)),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap, required this.state});

  final VoidCallback onTap;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: onTap,

      child: state.isLoading
          ? CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            )
          : Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key, required this.navigator});

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
          text: "Belum punya akun? ",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: "Daftar",
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