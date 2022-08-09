import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectImageWidget extends StatelessWidget {
  const SelectImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.white.withOpacity(.4),
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
    );
  }
}
