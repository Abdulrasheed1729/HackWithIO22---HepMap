import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class ProfileSettingTile extends StatelessWidget {
  const ProfileSettingTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
