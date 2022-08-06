import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/configs/configs.dart';

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

class InputTextBox extends StatelessWidget {
  const InputTextBox({
    Key? key,
    this.label,
    this.suffixWidget,
  }) : super(key: key);
  final String? label;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        labelText: label,
        suffixIconColor: AppColors.kBlackColor.withOpacity(.1),
        fillColor: AppColors.kBlackColor.withOpacity(.1),
        filled: true,
        contentPadding: const EdgeInsets.all(15.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide.none,
        ),
        constraints: const BoxConstraints(maxHeight: 55),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.isCurrentUser, required this.text})
      : super(key: key);
  final String text;
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 80.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isCurrentUser ? AppColors.kBlueColor : AppColors.kBlueShade,
            borderRadius: BorderRadius.only(
              topLeft: isCurrentUser
                  ? const Radius.circular(15)
                  : const Radius.circular(0),
              topRight: isCurrentUser
                  ? const Radius.circular(0)
                  : const Radius.circular(15),
              bottomLeft: const Radius.circular(15),
              bottomRight: const Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  left: isCurrentUser ? 15 : 0,
                  bottom: 5,
                  right: isCurrentUser ? 15.0 : 20,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isCurrentUser
                        ? AppColors.kwhiteColor
                        : AppColors.kBlackColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                  right: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '9.30',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
