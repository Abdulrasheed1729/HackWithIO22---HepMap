import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/modules.dart';

import '../../../app/bloc/enum.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Don't bother about this just continue with your work
  ///
  /// :)
  ///
  ///
  List<Page> onGenerateAppViewPages(
    AppStatus state,
    List<Page> pages,
  ) {
    switch (state) {
      case AppStatus.authenticated:
        return [HomeView.page()];
      case AppStatus.unauthenticated:
        return [SignInScreen.page()];
    }
  }

  // Future<void> transitToOnboardingPage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final showOnbarding = prefs.getBool('showOnboarding') ?? false;
  //   Future.delayed(
  //     const Duration(seconds: 5),
  //     () => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return showOnbarding
  //               ? FlowBuilder<AppStatus>(
  //                   state:
  //                       context.select((AppBloc bloc) => bloc.state.appStatus),
  //                   onGeneratePages: onGenerateAppViewPages,
  //                 )
  //               : const OnboardingScreen();
  //         },
  //       ),
  //     ),
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   transitToOnboardingPage();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     const Duration(seconds: 3),
  //     () => Navigator.of(context).pushNamed('/'),
  //   );
  // }

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
