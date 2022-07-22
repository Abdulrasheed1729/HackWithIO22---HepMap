import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/chat%20(todo)/chat.dart';
import 'package:hack_with_io/community/community.dart';
import 'package:hack_with_io/reminder/views/views.dart';

import 'home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPage = 0;

  static List<Widget> pages = <Widget>[
    const HomePage(),
    const ReminderView(),
    Container(),
    const ChatView(),
    const CommunityView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 0;
                  });
                },
                child: SvgPicture.asset(
                  'assets/home-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 0
                      ? AppColors.kBlackColor
                      : Colors.grey.shade500,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 1;
                  });
                },
                child: SvgPicture.asset(
                  'assets/reminder-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 1
                      ? AppColors.kBlackColor
                      : Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                  });
                },
                child: SvgPicture.asset(
                  'assets/add-symptom-small.svg',
                  height: 45,
                  width: 45,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 3;
                  });
                },
                child: SvgPicture.asset(
                  'assets/chat-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 3
                      ? AppColors.kBlackColor
                      : Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 4;
                  });
                },
                child: SvgPicture.asset(
                  'assets/community-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 4
                      ? AppColors.kBlackColor
                      : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
