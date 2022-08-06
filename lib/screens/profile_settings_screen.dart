import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/configs/configs.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    'assets/icons/times circle.svg',
                    height: 35,
                    width: 35,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/Bayo.jpg'),
                    radius: 25.0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.5),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/add photo.svg',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bayo',
                      textAlign: TextAlign.left,
                      style: kHeaderTaglineTextStyle,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '@bayonle',
                      style: kTaglineTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 40.0),
            const ProfileSettingTile(
              title: 'Medical Record',
            ),
            const ProfileSettingTile(
              title: 'See a Specialist',
            ),
            const ProfileSettingTile(
              title: 'My Prescriptions',
            ),
            const SizedBox(height: 30),
            const ProfileSettingTile(
              title: 'Change Password',
            ),
            const ProfileSettingTile(
              title: 'Contact Support',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Power Button.svg',
                  height: 25,
                  width: 20,
                ),
                const SizedBox(width: 10.0),
                Text(
                  'Log Out',
                  style: kTaglineTextStyle.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileSettingTile extends StatelessWidget {
  const ProfileSettingTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: kTaglineTextStyle.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        size: 25,
        color: AppColors.kBlackColor,
      ),
    );
  }
}
