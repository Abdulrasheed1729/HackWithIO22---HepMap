import 'package:flutter/material.dart';

import '../configs/configs.dart';

class NormalTextBox extends StatelessWidget {
  const NormalTextBox({
    Key? key,
    required this.label,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    TextEditingController? controller,
    this.errorText,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final String label;
  final bool isObscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: _controller,
        obscureText: isObscureText,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          labelStyle: kTextBoxLabelTextStyle.copyWith(fontFamily: 'Montserrat'),
          constraints: const BoxConstraints(maxHeight: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
