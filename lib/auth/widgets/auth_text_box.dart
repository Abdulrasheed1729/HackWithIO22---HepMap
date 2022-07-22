import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/utils/utils.dart';

class AuthTextBox extends StatelessWidget {
  const AuthTextBox({
    Key? key,
    required this.label,
    required this.suffixIconUrl,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    required TextEditingController controller,
    this.validator,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String label;
  final String suffixIconUrl;
  final bool isObscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: _controller,
        obscureText: isObscureText,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: kTextBoxLabelTextStyle.copyWith(fontFamily: 'Montserrat'),
          suffixIcon: SvgPicture.asset(
            suffixIconUrl,
            fit: BoxFit.scaleDown,
          ),
          constraints: const BoxConstraints(maxHeight: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
