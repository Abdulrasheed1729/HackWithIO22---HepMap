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
            //TODO Change the icon here.
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'assets/add-symptom-small.svg',
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
            style: kTaglineTextStyle.copyWith(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: 50),
      );
    },
  );
}
