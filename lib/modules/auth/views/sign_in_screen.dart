import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/auth/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: SignInScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => LoginCubit(context.read()<AuthRepository>()),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content:
                          Text(state.errorMessage ?? 'Authentication Failure'),
                    ),
                  );
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 20.0),
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
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        builder: (context, state) {
                          return AuthTextBox(
                            key: const Key('loginForm_emailInput_textField'),
                            label: 'Email',
                            onChanged: (email) =>
                                context.read<LoginCubit>().emailChanged(email),
                            suffixIconUrl: 'assets/icons/email.svg',
                            errorText:
                                state.email.invalid ? 'invalid email' : null,
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
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        builder: (context, state) {
                          return AuthTextBox(
                            key: const Key('loginForm_passwordInput_textField'),
                            label: 'Password',
                            suffixIconUrl: 'assets/icons/password.svg',
                            isObscureText: true,
                            onChanged: (password) => context
                                .read<LoginCubit>()
                                .emailChanged(password),
                            errorText:
                                state.password.invalid ? 'invalid email' : null,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return state.status.isSubmissionInProgress
                              ? const CircularProgressIndicator()
                              : AppWideButton(
                                  key: const Key(
                                    'loginForm_continue_raisedButton',
                                  ),
                                  onPressed: state.status.isValidated
                                      ? () => context
                                          .read<LoginCubit>()
                                          .logInWithCredentials()
                                      : null,
                                  label: 'LOGIN',
                                );
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
      ),
    );
  }
}
