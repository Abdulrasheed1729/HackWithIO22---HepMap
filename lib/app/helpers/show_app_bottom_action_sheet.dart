import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/modules.dart';
import '../configs/configs.dart';

Future<dynamic> showAppBottomActionSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    barrierColor: Colors.black.withOpacity(.5),
    backgroundColor: Colors.black.withOpacity(.0),
    clipBehavior: Clip.none,
    builder: (ctx) {
      return SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 25,
            right: 25,
            bottom: 10,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        SvgPicture.asset(
                          'assets/icons/times circle.svg',
                          height: 25,
                          width: 25,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SymptomsScreen(),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    'assets/icons/add-symptom-small.svg',
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    'Add Symptom',
                    style: kTaglineTextStyle.copyWith(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SetReminderScreen(),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    'assets/icons/add-symptom-small.svg',
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    'Add Reminder',
                    style: kTaglineTextStyle.copyWith(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddPostScreen(),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    'assets/icons/add-symptom-small.svg',
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    'Add Post',
                    style: kTaglineTextStyle.copyWith(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
