import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class MyPrescriptionScreen extends StatefulWidget {
  const MyPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<MyPrescriptionScreen> createState() => _MyPrescriptionScreenState();
}

class _MyPrescriptionScreenState extends State<MyPrescriptionScreen> {
  DateTime _selectedDate = DateTime.now();

  /// This function prompt the selection of [Date] for any upcomming
  /// event by the `User`.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
                  'My Prescriptions',
                  textAlign: TextAlign.center,
                  style: kHeaderTaglineTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Text(
              'Drug 1',
              style: kTaglineTextStyle.copyWith(
                fontFamily: 'Montserrat',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            const NormalTextBox(label: 'Drug 1'),
            const SizedBox(height: 25.0),
            Text(
              'Dose',
              style: kTaglineTextStyle.copyWith(
                fontFamily: 'Montserrat',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            const NormalTextBox(label: 'Dose'),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start date',
                      style: kTaglineTextStyle.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SelectDateWidget(
                      selectedDate: _selectedDate,
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End date',
                      style: kTaglineTextStyle.copyWith(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SelectDateWidget(
                      selectedDate: _selectedDate,
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            TextButton(
              onPressed: () {},
              child: Text(
                'Add drug +',
                style: kInfoTextStyle.copyWith(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kBlueColor,
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: AppWideButton(
                label: 'SAVE',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
