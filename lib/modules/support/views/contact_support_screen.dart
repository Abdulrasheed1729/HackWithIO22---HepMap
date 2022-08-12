import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class ContactSuppostScreen extends StatelessWidget {
  const ContactSuppostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Arrow-left.svg',
                    height: 40,
                    width: 40,
                  ),
                  color: AppColors.kBlackColor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Contact Support',
                  textAlign: TextAlign.center,
                  style: kHeaderTaglineTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    // fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
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
