import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/widgets/auth_button.dart';

import '../configs/configs.dart';
import 'screens.dart';

class SeeSpacialistScreen extends StatefulWidget {
  const SeeSpacialistScreen({Key? key}) : super(key: key);

  @override
  State<SeeSpacialistScreen> createState() => _SeeSpacialistScreenState();
}

class _SeeSpacialistScreenState extends State<SeeSpacialistScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, _) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
            ),
            child: TimePickerDialog(
              initialTime: TimeOfDay.now(),
            ),
          );
        });
    if (picked != null && picked != _selectedTime) {
      setState(
        () {
          _selectedTime = picked;
        },
      );
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
                  'See a Specialist',
                  textAlign: TextAlign.center,
                  style: kHeaderTaglineTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: kTaglineTextStyle.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ChooseDoctorScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Choose',
                    style: TextStyle(
                      color: AppColors.kBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            DoctorCard(
              name: 'Femi Marc',
              imageUrl: 'assets/images/Dr-Femi-Marc.jpg',
              cardColour: AppColors.kBlueColor,
              textColour: AppColors.kwhiteColor,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Date',
              style: kTaglineTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 15),
            SelectDateWidget(
              selectedDate: _selectedDate,
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 15),
            Text(
              'Time',
              style: kTaglineTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5.0),
            MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: SelectTimeWidget(
                selectedTime: _selectedTime,
                onTap: () {
                  _selectTime(context);
                },
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: AppWideButton(
                label: 'SCHEDULE',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    this.cardColour = Colors.white,
    this.textColour = Colors.black,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final Color cardColour;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: cardColour,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 10.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
                radius: 25.0,
              ),
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr $name',
                      textAlign: TextAlign.left,
                      style: kInfoTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: textColour,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'View Profile',
                      textAlign: TextAlign.left,
                      style: kTaglineTextStyle.copyWith(
                        color: textColour,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
