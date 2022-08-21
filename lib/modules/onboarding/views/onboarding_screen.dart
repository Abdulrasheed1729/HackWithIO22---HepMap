import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/auth/auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              "HepMap",
              textAlign: TextAlign.center,
              style: kSmallLogoTextStyle.copyWith(
                color: AppColors.kBlueColor,
                fontFamily: 'Comfortaa,',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Hepatitis\nCommunal\nSupport",
              textAlign: TextAlign.center,
              style: kHeadersTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Connect and share your\nexperiences with others.",
              textAlign: TextAlign.center,
              style: kHeaderTaglineTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
              ),
            ),
            SvgPicture.asset(
              'assets/illusts/getstarted-illust.svg',
              height: 280,
              width: 280,
            ),
            const SizedBox(height: 15),
            RawMaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              fillColor: AppColors.kBlueColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              constraints: const BoxConstraints(minHeight: 49),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: AppColors.kwhiteColor,
                ),
              ),
            ),
            Expanded(
              child: Row(
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
            ),
          ],
        ),
      ),
    ));
  }
}
