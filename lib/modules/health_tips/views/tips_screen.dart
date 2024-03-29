import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class HealthTipsScreen extends StatelessWidget {
  const HealthTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'My Tips',
        context: context,
        backgroundColour: AppColors.kwhiteColor,
        foregroundColour: AppColors.kBlackColor,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Home-made healthy drinks',
              textAlign: TextAlign.center,
              style: kSmallLogoTextStyle.copyWith(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 35.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/Healthy-drink.jpg'),
                  radius: 45.0,
                ),
              ],
            ),
            const SizedBox(height: 35.0),
            DecoratedBox(
              decoration: const BoxDecoration(),
              child: Text(
                'Imagine that you are in the kitchen of your favourite cafe.\n\nYou have a pitcher of your favourite smoothie and the blender is whirring.\n\nThe ingredients in this blender are just as fresh as the memories it invokes.\n\nThey are simple, too: a couple of scoops of your favourite fruit, a few cups of water, and a touch of honey.\n\nWith these ingredients, you can make any kind of smoothie that you want want you can even add a spoonful of peanut butter for a protein boost.',
                style: kTaglineTextStyle.copyWith(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
