import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/app/helpers/input_validator.dart';
import 'package:hack_with_io/modules/auth/notifiers/login_notifier.dart';

import 'sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: SignInScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm>
    with InputValidatorMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  "Welcome\nback",
                  textAlign: TextAlign.center,
                  style: kHeadersTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Get your health\nback on track',
                textAlign: TextAlign.center,
                style: kHeaderTaglineTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Email',
                  style: kTextBoxLabelTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              AuthTextBox(
                controller: emailController,
                key: const Key('loginForm_emailInput_textField'),
                label: 'Email',
                suffixIconUrl: 'assets/icons/email.svg',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Password',
                  style: kTextBoxLabelTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              AuthTextBox(
                key: const Key('loginForm_passwordInput_textField'),
                controller: passwordController,
                label: 'Password',
                suffixIconUrl: 'assets/icons/password.svg',
                isObscureText: !loginState.passwordVisible,
              ),
              const SizedBox(
                height: 20,
              ),
              AppWideButton(
                key: const Key(
                  'loginForm_continue_raisedButton',
                ),
                onPressed: () async {
                  await ref.read(loginNotifierProvider.notifier).login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                label: 'LOGIN',
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot your password?',
                  style: kInfoTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: kInfoTextStyle.copyWith(
                      color: AppColors.kBlackColor,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: kInfoTextStyle.copyWith(
                        color: AppColors.kBlueColor,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
