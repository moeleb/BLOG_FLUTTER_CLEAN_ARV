import 'package:bloc/core/theme/app_palette.dart';
import 'package:bloc/feature/auth/presentataion/pages/signup_page.dart';
import 'package:bloc/feature/auth/presentataion/widgets/auth_field.dart';
import 'package:bloc/feature/auth/presentataion/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 15),
              AuthGradientButton(buttonText: 'Sign in', onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignupPage.route());
                  },
                child: RichText(
                  text: TextSpan(
                      text: "Don't Have an account? ",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                              color: AppPalette.gradient2,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
