import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

///==============================================================
///|            Warning!, Warning!!, Warning!!!                |
///==============================================================
///
/// For any other developer that will be working on this file
/// please don't for get to refactor this file, it actually needs an
/// heavy refactoring .........................................
//TODO Alaye refactor this file later nah :(
class SetReminderScreen extends StatefulWidget {
  const SetReminderScreen({Key? key}) : super(key: key);

  @override
  State<SetReminderScreen> createState() => _SetReminderScreenState();
}

class _SetReminderScreenState extends State<SetReminderScreen> {
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
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
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
      appBar: buildAppBar(
        'Set Reminder',
        context: context,
        backgroundColour: AppColors.kBlueColor,
        foregroundColour: AppColors.kwhiteColor,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            color: AppColors.kBlueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'I want to do...',
                      hintStyle: kTaglineTextStyle.copyWith(
                        color: AppColors.kwhiteColor.withOpacity(.5),
                        fontWeight: FontWeight.w300,
                      ),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Date',
              style: kTaglineTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SelectDateWidget(
              selectedDate: _selectedDate,
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Time',
              style: kTaglineTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: SelectTimeWidget(
                selectedTime: _selectedTime,
                onTap: () {
                  _selectTime(context);
                },
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 100.0,
              left: 25.0,
              right: 25.0,
            ),
            child: AppWideButton(
              label: 'SAVE',
              onPressed: () {
                showDialogWidget(
                  desc: 'Reminder added!',
                  context: context,
                  iconUrl: 'assets/icons/Check-large.svg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
