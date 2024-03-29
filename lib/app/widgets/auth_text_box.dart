import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/configs.dart';

class AuthTextBox extends StatelessWidget {
  const AuthTextBox({
    Key? key,
    required this.label,
    required this.suffixIconUrl,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.errorText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String suffixIconUrl;
  final bool isObscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          labelStyle: kTextBoxLabelTextStyle.copyWith(fontFamily: 'Montserrat'),
          suffixIcon: SvgPicture.asset(
            suffixIconUrl,
            fit: BoxFit.scaleDown,
          ),
          constraints: const BoxConstraints(minHeight: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
