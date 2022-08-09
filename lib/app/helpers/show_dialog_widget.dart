import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/configs.dart';

void showDialogWidget(
    {required String desc, required BuildContext context, required iconUrl}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        title: Row(
          children: [
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'assets/icons/times circle.svg',
                height: 30,
                width: 30,
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: SvgPicture.asset(
          iconUrl,
          height: 120,
          width: 120,
        ),
        actions: [
          Text(
            desc,
            textAlign: TextAlign.center,
            style: kTaglineTextStyle.copyWith(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: 40),
      );
    },
  );
}
