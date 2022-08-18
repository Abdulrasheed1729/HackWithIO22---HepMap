import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class ContactSuppostScreen extends StatelessWidget {
  const ContactSuppostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, 'Contact Support'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Need help?',
              textAlign: TextAlign.center,
              style: kSmallLogoTextStyle.copyWith(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45.0),
            Text(
              'Kindly enter the details of your request',
              style: kTaglineTextStyle.copyWith(
                fontFamily: 'Montserrat',
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              maxLines: 6,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                cut: true,
                selectAll: true,
              ),
              decoration: InputDecoration(
                hintText: '',
                fillColor: AppColors.kwhiteColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 80.0),
            AppWideButton(
              label: 'SUBMIT',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
