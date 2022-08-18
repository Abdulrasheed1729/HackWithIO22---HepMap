import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ChooseDoctorScreen extends StatelessWidget {
  ChooseDoctorScreen({Key? key}) : super(key: key);
  final doctors = Doctor.demoDoctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, 'Choose a Doctor'),
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
