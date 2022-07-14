import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/auth/bloc/auth_bloc.dart';
import 'package:hack_with_io/auth/views/sign_up.dart';
import 'package:hack_with_io/home/views/home_view.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: kTextBoxLabelTextStyle.copyWith(
                            fontFamily: 'Montserrat'),
                        suffixIcon: SvgPicture.asset(
                          'assets/email.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        constraints: const BoxConstraints(maxHeight: 40),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: kTextBoxLabelTextStyle.copyWith(
                          fontFamily: 'Montserrat',
                        ),
                        suffixIcon: SvgPicture.asset(
                          'assets/password.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        constraints: const BoxConstraints(maxHeight: 40),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RawMaterialButton(
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
                    fillColor: AppColors.kBlueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    constraints: const BoxConstraints(minHeight: 49.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        color: AppColors.kwhiteColor,
                      ),
                    ),
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
                  Container(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
