import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/auth/views/sign_in.dart';

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
                  child: SvgPicture.asset('assets/registered-illust.svg'),
                ),
                Text(
                  "You have successfully registered!",
                  textAlign: TextAlign.center,
                  style: kInfoTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    fontFamily: 'Montserrat',
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
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
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      color: AppColors.kwhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
