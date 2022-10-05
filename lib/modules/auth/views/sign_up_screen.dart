import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/auth/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  // final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _passwordController = TextEditingController();

  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => SignUpCubit(context.read<AuthRepository>()),
          child: const SignUpForm(
              // passwordController: _passwordController,
              // confirmPasswordController: _confirmPasswordController,
              ),
        ),
      ),
    );
  }

  // String? passwordValidator(value) {
  //   if (value != _passwordController.text) {
  //     return 'Password does not match';
  //   }
  //   return null;
  // }

  // String? emailValidator(value) {
  //   if (value!.length < 4) {
  //     return 'Too Short';
  //   } else if (value.isEmpty) {
  //     return 'Email cannot be empty';
  //   } else if (!value.contains('@')) {
  //     return 'Invalid mail';
  //   }
  //   return null;
  // }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    // required TextEditingController passwordController,
    // required TextEditingController confirmPasswordController,
  }) :
        // _passwordController = passwordController,
        //       _confirmPasswordController = confirmPasswordController,
        super(key: key);

  // final TextEditingController _passwordController;
  // final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const SignInScreen(),
          //   ),
          // );
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: SingleChildScrollView(
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
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return AuthTextBox(
                      key: const Key('signUpForm_emailInput_textField'),
                      label: 'Email',
                      suffixIconUrl: 'assets/icons/email.svg',
                      onChanged: (email) =>
                          context.read<SignUpCubit>().emailChanged(email),
                      errorText: state.email.invalid ? 'invalid email' : null,
                    );
                  },
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
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    return AuthTextBox(
                      key: const Key('signUpForm_passwordInput_textField'),
                      label: 'Password',
                      suffixIconUrl: 'assets/icons/password.svg',
                      isObscureText: true,
                      onChanged: (password) =>
                          context.read<SignUpCubit>().passwordChanged(password),
                      errorText:
                          state.password.invalid ? 'invalid password' : null,
                    );
                  },
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
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password ||
                      previous.confirmPassword != current.confirmPassword,
                  builder: (context, state) {
                    return AuthTextBox(
                      key: const Key(
                          'signUpForm_confirmedPasswordInput_textField'),
                      label: 'Confirm Password',
                      suffixIconUrl: 'assets/icons/password.svg',
                      isObscureText: true,
                      onChanged: (confirmPassword) => context
                          .read<SignUpCubit>()
                          .confirmedPasswordChanged(confirmPassword),
                      errorText: state.confirmPassword.invalid
                          ? 'password does not match'
                          : null,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return state.status.isSubmissionInProgress
                        ? const CircularProgressIndicator()
                        : AppWideButton(
                            key: const Key('signUpForm_continue_raisedButton'),
                            label: 'REGISTER',
                            onPressed: state.status.isValidated
                                ? () => context
                                    .read<SignUpCubit>()
                                    .signUpFormSubmitted()
                                : null,
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
      ),
    );
  }
}
