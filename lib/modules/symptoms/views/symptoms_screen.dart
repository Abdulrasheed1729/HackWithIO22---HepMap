import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  bool _isSelected = false;

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
          'My Symptoms',
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
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SymptomButton(
                  desc: 'Fatigue',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
                SymptomButton(
                  desc: 'Bruise',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SymptomButton(
                  desc: 'Fatigue',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
                SymptomButton(
                  desc: 'Bruise',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SymptomButton(
                  desc: 'Fatigue',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
                SymptomButton(
                  desc: 'Bruise',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SymptomButton(
                  desc: 'Fatigue',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
                SymptomButton(
                  desc: 'Bruise',
                  textColor: _isSelected
                      ? AppColors.kwhiteColor
                      : AppColors.kBlackColor,
                  buttonColor:
                      _isSelected ? AppColors.kBlueColor : AppColors.kBlueShade,
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: AppWideButton(
                label: 'APPLY',
                onPressed: () {
                  showDialogWidget(
                    desc:
                        'Your symptoms have been applied!!\n\n We\'ll update your tips to help you\nunderstand how to relieve yourself.',
                    context: context,
                    iconUrl: 'assets/icons/Check-large.svg',
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

class SymptomButton extends StatelessWidget {
  const SymptomButton({
    Key? key,
    required this.desc,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  final String desc;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      fillColor: buttonColor,
      constraints: const BoxConstraints(
        minWidth: 120,
        minHeight: 40,
      ),
      child: Text(
        desc,
        style: kInfoTextStyle.copyWith(
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
