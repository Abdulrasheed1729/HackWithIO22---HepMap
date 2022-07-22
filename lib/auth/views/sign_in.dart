import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/auth/bloc/auth_bloc.dart';
import 'package:hack_with_io/auth/views/sign_up.dart';
import 'package:hack_with_io/home/views/home_view.dart';

import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      controller: _emailController,
                      label: 'Email',
                      suffixIconUrl: 'assets/email.svg',
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
                      controller: _passwordController,
                      label: 'Password',
                      suffixIconUrl: 'assets/password.svg',
                      isObscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButton(
                      label: 'LOGIN',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              LoginWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                        if (context.read<AuthBloc>().state is AuthFailure) {
                          return;
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        }
                      },
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
                                builder: (context) => SignUpScreen(),
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
          ),
        ),
      ),
    );
  }
}
