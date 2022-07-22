import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: AppColors.kBlueColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      constraints: const BoxConstraints(minHeight: 49.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: AppColors.kwhiteColor,
        ),
      ),
    );
  }
}
