import 'package:flutter/material.dart';
import 'package:hack_with_io/configs/configs.dart';
import 'package:hack_with_io/screens/screens.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HepMap',
              style: kSmallLogoTextStyle.copyWith(
                color: AppColors.kBlueColor,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Hello, Bayo!',
              style: kHeaderTaglineTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileSettingScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/Bayo.jpg'),
            radius: 25.0,
          ),
        ),
      ],
    );
  }
}
