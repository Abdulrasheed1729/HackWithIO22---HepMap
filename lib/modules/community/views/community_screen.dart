import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Community',
                style: kInfoTextStyle.copyWith(fontFamily: 'Monteserrat'),
              ),
              SvgPicture.asset(
                'assets/icons/Search-icon.svg',
                height: 20,
                width: 20,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: AppColors.kYellowShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/Faeda.jpg'),
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    'Faeda S.',
                                    style: kInfoTextStyle.copyWith(
                                      fontFamily: 'Monteserrat',
                                    ),
                                  ),
                                  const Text('@fdeya'),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Today, 5.59pm',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Can I take Slovador in the\nafternoon, if I missed the\nmorning dose?',
                            style: kInfoTextStyle.copyWith(
                              fontFamily: 'Monteserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                        title: Row(
                                          children: [
                                            Expanded(child: Container()),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/times circle.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        content: Column(
                                          children: [
                                            TextField(
                                              maxLines: 5,
                                              toolbarOptions:
                                                  const ToolbarOptions(
                                                copy: true,
                                                cut: true,
                                                selectAll: true,
                                              ),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Type your relpy here...',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/add-photo-video.svg'),
                                                const SizedBox(width: 10.0),
                                                SvgPicture.asset(
                                                  'assets/icons/attach-chat.svg',
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                              'assets/icons/send-reply-icon.svg',
                                              height: 30.0,
                                              width: 30.0,
                                            ),
                                          )
                                        ],
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actionsPadding:
                                            const EdgeInsets.only(bottom: 15),
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/replyandlike-icon.svg',
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/Umar.jpg'),
                                radius: 18,
                              ),
                              SizedBox(width: 10),
                              Text(
                                  'I\'m not sure, you can check with\nyour doctor.')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
