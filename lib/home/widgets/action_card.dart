import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({
    Key? key,
    required this.iconUrl,
    required this.text,
  }) : super(key: key);

  final String text;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconUrl,
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: kHeaderTaglineTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
