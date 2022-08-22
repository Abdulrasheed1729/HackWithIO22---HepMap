import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _resetEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/icons/times circle.svg',
                      height: 20.0,
                      width: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: kSmallLogoTextStyle.copyWith(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'No worries! Enter the email address you registered with, we\'ll send you a link to reset your password.',
                    textAlign: TextAlign.justify,
                    style: kTaglineTextStyle.copyWith(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45.0),
              Text(
                'Email',
                style: kTextBoxLabelTextStyle.copyWith(
                    color: AppColors.kBlueColor, fontFamily: 'Montserrat'),
              ),
              const SizedBox(height: 5.0),
              AuthTextBox(
                label: 'Email',
                suffixIconUrl: 'assets/icons/email.svg',
                controller: _resetEmailController,
              ),
              const SizedBox(height: 200.0),
              AppWideButton(
                label: 'SEND LINK',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
