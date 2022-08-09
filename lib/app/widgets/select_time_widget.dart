import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({
    Key? key,
    required TimeOfDay selectedTime,
    required this.onTap,
  })  : _selectedTime = selectedTime,
        super(key: key);

  final TimeOfDay _selectedTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
          top: BorderSide(width: 1.0, color: Colors.grey),
          left: BorderSide(width: 1.0, color: Colors.grey),
          right: BorderSide(width: 1.0, color: Colors.grey),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime.format(context).toString(),
              style: kTextBoxLabelTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
