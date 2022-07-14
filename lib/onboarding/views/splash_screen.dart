import 'package:flutter/material.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/home/views/home_view.dart';
import 'package:hack_with_io/onboarding/views/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Don't bother about this just continue with your work
  ///
  /// :)
  Future<void> transitToOnboardingPage() async {
    final prefs = await SharedPreferences.getInstance();
    final showOnbarding = prefs.getBool('showOnboarding') ?? false;
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return showOnbarding ? const HomeView() : const OnboardingScreen();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // transitToOnboardingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.kBlueColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HepMap",
              style: kLogoTextStyle.copyWith(
                color: AppColors.kwhiteColor,
                fontFamily: 'Comfortaa',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You don't want to go\nthrough this alone.",
              textAlign: TextAlign.center,
              style: kTaglineTextStyle.copyWith(
                  color: AppColors.kwhiteColor, fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}
