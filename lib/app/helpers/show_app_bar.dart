import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/configs.dart';

AppBar buildAppBar(
  String title, {
  required BuildContext context,
  required Color backgroundColour,
  required Color foregroundColour,
  required VoidCallback onTap,
}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: backgroundColour,
    leading: Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          'assets/icons/Arrow-left.svg',
          height: 40,
          width: 40,
          color: foregroundColour,
        ),
      ),
    ),
    iconTheme: const IconThemeData(size: 25.0),
    title: Text(
      title,
    ),
    titleTextStyle: kHeaderTaglineTextStyle.copyWith(
      color: foregroundColour,
      fontSize: 16.0,
      fontFamily: 'Comfortaa',
    ),
    centerTitle: true,
  );
}
