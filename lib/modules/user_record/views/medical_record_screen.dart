import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class MedicalRecordScreeen extends StatefulWidget {
  const MedicalRecordScreeen({Key? key}) : super(key: key);

  @override
  State<MedicalRecordScreeen> createState() => _MedicalRecordScreeenState();
}

class _MedicalRecordScreeenState extends State<MedicalRecordScreeen> {
  DateTime _selectedDate = DateTime(1900);

  /// This function prompt the selection of [Date] for any upcomming
  /// event by the `User`.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2005, 12, 31),
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
      body: SingleChildScrollView(
        child: Padding(
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
                    'Medical Record',
                    textAlign: TextAlign.center,
                    style: kHeaderTaglineTextStyle.copyWith(
                      color: AppColors.kBlackColor,
                      // fontFamily: 'Comfortaa',
                    ),
                  ),
                  // Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 30.0),
              Text(
                'Full Name',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              const NormalTextBox(label: ''),
              const SizedBox(height: 15),
              Text(
                'Birth Date',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5.0),
              SelectDateWidget(
                selectedDate: _selectedDate,
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 15),
              Text(
                'Weight',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              const NormalTextBox(label: ''),
              const SizedBox(height: 15),
              Text(
                'Height',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              const NormalTextBox(label: ''),
              const SizedBox(height: 15),
              Text(
                'Hepatitis Type',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              const NormalTextBox(label: ''),
              const SizedBox(height: 15),
              Text(
                'Emergency Contact',
                style: kTextBoxLabelTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              const NormalTextBox(
                label: '',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              AppWideButton(
                label: 'SAVE',
                onPressed: () {
                  showDialogWidget(
                    desc: 'Your records have been saved!',
                    context: context,
                    iconUrl: 'assets/icons/Check-large.svg',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
