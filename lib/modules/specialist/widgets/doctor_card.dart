import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    this.cardColour = Colors.white,
    this.textColour = Colors.black,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final Color cardColour;
  final Color textColour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: cardColour,
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imageUrl),
                  radius: 25.0,
                ),
                const SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr $name',
                        textAlign: TextAlign.left,
                        style: kInfoTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: textColour,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'View Profile',
                        textAlign: TextAlign.left,
                        style: kTaglineTextStyle.copyWith(
                          color: textColour,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
