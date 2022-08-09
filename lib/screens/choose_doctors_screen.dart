import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/models/doctor_model.dart';

import '../configs/configs.dart';
import 'screens.dart';

class ChooseDoctorScreen extends StatelessWidget {
  ChooseDoctorScreen({Key? key}) : super(key: key);
  final doctors = Doctor.demoDoctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Arrow-left.svg',
                    height: 45,
                    width: 45,
                  ),
                  color: AppColors.kBlackColor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Choose a Doctor',
                  textAlign: TextAlign.center,
                  style: kHeaderTaglineTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerLeft,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Search-icon.svg',
                    height: 25,
                    width: 25,
                  ),
                  color: AppColors.kBlackColor,
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    name: doctors[index].name,
                    imageUrl: doctors[index].imageUrl,
                    cardColour: AppColors.kwhiteColor,
                    textColour: AppColors.kBlackColor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
