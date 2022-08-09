import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';

import '../widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Arrow-left.svg',
                    height: 45,
                    width: 45,
                  ),
                  color: AppColors.kBlackColor,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Bayo.jpg'),
                  radius: 20.0,
                ),
                const SizedBox(width: 10),
                Text(
                  'Kunle',
                  style: kHeaderTaglineTextStyle.copyWith(
                      color: AppColors.kBlackColor),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 50),
            ListView(
              shrinkWrap: true,
              children: const [
                ChatBubble(
                  isCurrentUser: true,
                  text: 'Hey, were you able to get those drugs ?',
                ),
                //! Replace that emoji bro
                SizedBox(height: 10),
                ChatBubble(
                  isCurrentUser: false,
                  text: 'Yes, I was. Thanks bro!',
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: InputTextBox(
                  label: 'Send a message',
                  suffixWidget: SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/attach-chat.svg',
                          color: Colors.grey,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/icons/send-chat.svg',
                          color: AppColors.kBlackColor.withOpacity(.4),
                          height: 25,
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
