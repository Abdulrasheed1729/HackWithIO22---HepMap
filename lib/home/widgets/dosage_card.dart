import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';

class DosageCard extends StatefulWidget {
  const DosageCard({
    Key? key,
    required this.colour,
    required this.numberOftablets,
    required this.text,
  }) : super(key: key);

  final String text;
  final int numberOftablets;
  final Color colour;

  @override
  State<DosageCard> createState() => _DosageCardState();
}

class _DosageCardState extends State<DosageCard> {
  String iconUrl = 'assets/dosage-check button1.svg';
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: widget.colour,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: kHeaderTaglineTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.numberOftablets} tablets',
                textAlign: TextAlign.center,
                style: kHeaderTaglineTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // iconUrl = 'assets/dosage-check button2.svg';
                    _isChecked = !_isChecked;
                    // print(iconUrl);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SvgPicture.asset(
                    _isChecked
                        ? 'assets/dosage-check button2.svg'
                        : 'assets/dosage-check button1.svg',
                    height: 40,
                    width: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
