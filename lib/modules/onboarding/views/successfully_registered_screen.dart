import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/auth/auth.dart';

class SuccessfullyRegisteredScreen extends StatefulWidget {
  const SuccessfullyRegisteredScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfullyRegisteredScreen> createState() =>
      _SuccessfullyRegisteredScreenState();
}

class _SuccessfullyRegisteredScreenState
    extends State<SuccessfullyRegisteredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child:
                      SvgPicture.asset('assets/illusts/registered-illust.svg'),
                ),
                Text(
                  "You have successfully registered!",
                  textAlign: TextAlign.center,
                  style: kInfoTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
                AppWideButton(
                  label: 'LOGIN',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
