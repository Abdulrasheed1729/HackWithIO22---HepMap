import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.kBlueColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              'assets/icons/Arrow-left.svg',
              height: 40,
              width: 40,
              color: AppColors.kwhiteColor,
            ),
          ),
        ),
        iconTheme: const IconThemeData(size: 25.0),
        title: const Text(
          'Doctor Profile',
        ),
        titleTextStyle: kHeaderTaglineTextStyle.copyWith(
          color: AppColors.kwhiteColor,
          fontSize: 16.0,
          fontFamily: 'Comfortaa',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Dr-Femi-Marc.jpg'),
                    radius: 35.0,
                  ),
                  Positioned(
                    right: -8.0,
                    bottom: 15.0,
                    child: SvgPicture.asset(
                      'assets/icons/check circle.svg',
                      height: 20.0,
                      width: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Dr Femi Marc',
              textAlign: TextAlign.center,
              style: kInfoTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: AppColors.kBlackColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Licensed Hepatologist',
              textAlign: TextAlign.center,
              style: kInfoTextStyle.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                color: AppColors.kBlackColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  height: 15.0,
                  width: 15.0,
                ),
                const SizedBox(width: 5.0),
                Text(
                  '4.6',
                  textAlign: TextAlign.center,
                  style: kInfoTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: AppColors.kBlackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            DecoratedBox(
              decoration: const BoxDecoration(),
              child: Text(
                'He is a licensed Hepatologist with over 10 years experience in diagnosing and testing liver pathologies.\n\nHe specializes in the care of parents with cirrhosis, viral hepatitis, autoimmune hepatitis, and inherited live diseases.',
                style: kInfoTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  fontFamily: 'Montserrat',
                  color: AppColors.kBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
