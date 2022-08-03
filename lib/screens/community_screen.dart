import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/configs/configs.dart';

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
                'assets/Search-icon.svg',
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
                                backgroundImage: AssetImage('assets/Faeda.jpg'),
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    'Faeda S.',
                                    style: kInfoTextStyle.copyWith(
                                      fontFamily: 'MOnteserra',
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
                              SvgPicture.asset(
                                'assets/replyandlike-icon.svg',
                                height: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/Umar.jpg'),
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
