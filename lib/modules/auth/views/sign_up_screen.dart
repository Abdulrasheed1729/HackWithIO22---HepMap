import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/app/helpers/input_validator.dart';
import 'package:hack_with_io/modules/auth/auth.dart';
import 'package:hack_with_io/modules/auth/notifiers/login_notifier.dart';
import 'package:hack_with_io/modules/auth/notifiers/sign_up_notifier.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignUpForm(
            // passwordController: _passwordController,
            // confirmPasswordController: _confirmPasswordController,
            ),
      ),
    );
  }
}

class SignUpForm extends ConsumerWidget with InputValidatorMixin {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: kHeadersTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
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
                key: const Key('signUpForm_emailInput_textField'),
                controller: emailController,
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
                key: const Key('signUpForm_passwordInput_textField'),
                controller: passwordController,
                label: 'Password',
                suffixIconUrl: 'assets/icons/password.svg',
                isObscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Confirm Password',
                  style: kTextBoxLabelTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              // BlocBuilder<SignUpCubit, SignUpState>(
              //   buildWhen: (previous, current) =>
              //       previous.password != current.password ||
              //       previous.confirmPassword != current.confirmPassword,
              //   builder: (context, state) {
              //     return AuthTextBox(
              //       key: const Key(
              //           'signUpForm_confirmedPasswordInput_textField'),
              //       label: 'Confirm Password',
              //       suffixIconUrl: 'assets/icons/password.svg',
              //       isObscureText: true,
              //       onChanged: (confirmPassword) => context
              //           .read<SignUpCubit>()
              //           .confirmedPasswordChanged(confirmPassword),
              //       errorText: state.confirmPassword.invalid
              //           ? 'password does not match'
              //           : null,
              //     );
              //   },
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              AppWideButton(
                key: const Key('signUpForm_continue_raisedButton'),
                label: 'REGISTER',
                onPressed: () {
                  ref.read(signUpNotifierProvider.notifier).signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'By clicking "REGISTER", you agree to HepMap ',
                  style: kInfoTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy',
                      style: kTextBoxLabelTextStyle.copyWith(
                          color: AppColors.kBlueColor),
                    ),
                    const TextSpan(text: '.')
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered?",
                    style: kInfoTextStyle.copyWith(
                      color: AppColors.kBlackColor,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign in",
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
