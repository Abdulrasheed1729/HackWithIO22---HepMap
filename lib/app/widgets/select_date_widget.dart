import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    Key? key,
    required DateTime selectedDate,
    required this.onTap,
  })  : _selectedDate = selectedDate,
        super(key: key);

  final DateTime _selectedDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
              '${_selectedDate.toLocal()}'.split(' ')[0],
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
