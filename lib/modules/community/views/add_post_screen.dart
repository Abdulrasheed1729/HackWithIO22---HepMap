import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/app.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Add Post',
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
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Bayo.jpg'),
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
                SvgPicture.asset('assets/icons/add-photo-video.svg'),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'assets/icons/attach-chat.svg',
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
                    context: context,
                    desc: 'Your post has been shared!',
                    iconUrl: 'assets/icons/check circle.svg',
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
