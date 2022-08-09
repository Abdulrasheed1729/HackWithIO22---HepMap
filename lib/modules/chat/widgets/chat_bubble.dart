import 'package:flutter/material.dart';
import 'package:hack_with_io/app/app.dart';

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
