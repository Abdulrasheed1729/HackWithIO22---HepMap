import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class InputTextBox extends StatelessWidget {
  const InputTextBox({
    Key? key,
    this.label,
    this.suffixWidget,
  }) : super(key: key);
  final String? label;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        labelText: label,
        suffixIconColor: AppColors.kBlackColor.withOpacity(.1),
        fillColor: AppColors.kBlackColor.withOpacity(.1),
        filled: true,
        contentPadding: const EdgeInsets.all(15.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide.none,
        ),
        constraints: const BoxConstraints(maxHeight: 55),
      ),
    );
  }
}
