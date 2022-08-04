import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/widgets/auth_button.dart';

import '../configs/configs.dart';
import '../helpers/helpers.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

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
                    'assets/Arrow-left.svg',
                    height: 45,
                    width: 45,
                  ),
                  color: AppColors.kBlackColor,
                ),
                // const CircleAvatar(
                //   backgroundImage: AssetImage('assets/Bayo.jpg'),
                //   radius: 20.0,
                // ),
                const SizedBox(width: 10),
                Text(
                  'Add Post',
                  textAlign: TextAlign.center,
                  style: kHeaderTaglineTextStyle.copyWith(
                    color: AppColors.kBlackColor,
                    // fontFamily: 'Comfortaa',
                  ),
                ),
                // Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/Bayo.jpg'),
                  radius: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              maxLines: 10,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                cut: true,
                selectAll: true,
              ),
              decoration: InputDecoration(
                hintText: 'I want to say...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.photo_camera_outlined,
                  size: 25,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'assets/attach-chat.svg',
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: AppWideButton(
                label: 'CREATE POST',
                onPressed: () {
                  showDialogWidget(
                    desc: 'Your post has been shared!',
                    context: context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
