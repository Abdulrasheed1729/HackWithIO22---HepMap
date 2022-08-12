import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/modules.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({
    Key? key,
    required this.colour,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  final String text;
  final String imageUrl;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const MyTipsScreen();
              },
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: kTaglineTextStyle.copyWith(
                        color: AppColors.kBlackColor,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SvgPicture.asset(
                      imageUrl,
                      height: 90,
                      width: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
