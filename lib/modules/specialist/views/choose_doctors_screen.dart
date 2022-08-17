import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ChooseDoctorScreen extends StatelessWidget {
  ChooseDoctorScreen({Key? key}) : super(key: key);
  final doctors = Doctor.demoDoctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.kwhiteColor,
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
              color: AppColors.kBlackColor,
            ),
          ),
        ),
        iconTheme: const IconThemeData(size: 25.0),
        title: const Text(
          'Choose a Doctor',
        ),
        titleTextStyle: kHeaderTaglineTextStyle.copyWith(
          color: AppColors.kBlackColor,
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
                    onTap: () {},
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
