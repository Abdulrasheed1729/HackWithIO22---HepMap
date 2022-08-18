import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/configs.dart';

AppBar BuildAppBar(
  BuildContext context,
  String title,
) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.kwhiteColor,
    leading: Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(
          'assets/icons/Arrow-left.svg',
          height: 40,
          width: 40,
          color: AppColors.kBlackColor,
        ),
      ),
    ),
    iconTheme: const IconThemeData(size: 25.0),
    title: Text(
      title,
    ),
    titleTextStyle: kHeaderTaglineTextStyle.copyWith(
      color: AppColors.kBlackColor,
      fontSize: 16.0,
      fontFamily: 'Comfortaa',
    ),
    centerTitle: true,
  );
}
