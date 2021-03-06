import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/auth/bloc/auth_bloc.dart';
import 'package:hack_with_io/auth/views/sign_in.dart';
import 'package:hack_with_io/auth/views/successfully_registered.dart';
import 'package:hack_with_io/auth/widgets/widgets.dart';
import 'package:hack_with_io/home/views/home_view.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSucess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
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
                      label: 'Email',
                      suffixIconUrl: 'assets/email.svg',
                      controller: _emailController,
                      validator: emailValidator,
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
                      label: 'Password',
                      suffixIconUrl: 'assets/password.svg',
                      controller: _passwordController,
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
                    AuthTextBox(
                      label: 'Confirm Password',
                      suffixIconUrl: 'assets/password.svg',
                      controller: _confirmPasswordController,
                      validator: passwordValidator,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButton(
                      label: 'REGISTER',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              CreateAccount(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                        if (context.read<AuthBloc>().state is AuthFailure) {
                          return;
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SuccessfullyRegisteredScreen(),
                            ),
                          );
                        }
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
                          ]),
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
                                builder: (context) => SignInScreen(),
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
        ),
      ),
    );
  }

  String? passwordValidator(value) {
    if (value != _passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  String? emailValidator(value) {
    if (value!.length < 4) {
      return 'Too Short';
    } else if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!value.contains('@')) {
      return 'Invalid mail';
    }
    return null;
  }
}
