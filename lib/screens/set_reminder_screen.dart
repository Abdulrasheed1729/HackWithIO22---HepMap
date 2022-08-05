import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/helpers/show_dialog_widget.dart';
import 'package:hack_with_io/widgets/auth_button.dart';

import '../configs/configs.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            color: AppColors.kBlueColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(
                          'assets/Arrow-left.svg',
                          height: 45,
                          width: 45,
                          color: AppColors.kwhiteColor,
                        ),
                        color: AppColors.kwhiteColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Set Reminder',
                        textAlign: TextAlign.center,
                        style: kHeaderTaglineTextStyle.copyWith(
                          color: AppColors.kwhiteColor,
                          // fontFamily: 'Comfortaa',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
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
                  iconUrl: 'assets/add-symptom-small.svg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    Key? key,
    required DateTime selectedDate,
    required this.onTap,
  })  : _selectedDate = selectedDate,
        super(key: key);

  final DateTime _selectedDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
          top: BorderSide(width: 1.0, color: Colors.grey),
          left: BorderSide(width: 1.0, color: Colors.grey),
          right: BorderSide(width: 1.0, color: Colors.grey),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_selectedDate.toLocal()}'.split(' ')[0],
              style: kTextBoxLabelTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({
    Key? key,
    required TimeOfDay selectedTime,
    required this.onTap,
  })  : _selectedTime = selectedTime,
        super(key: key);

  final TimeOfDay _selectedTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
          top: BorderSide(width: 1.0, color: Colors.grey),
          left: BorderSide(width: 1.0, color: Colors.grey),
          right: BorderSide(width: 1.0, color: Colors.grey),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime.format(context).toString(),
              style: kTextBoxLabelTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
