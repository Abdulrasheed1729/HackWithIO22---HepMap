import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/app.dart';
import 'package:hack_with_io/modules/chat/chat.dart';
import 'package:hack_with_io/modules/community/community.dart';
import 'package:hack_with_io/modules/reminder/reminder.dart';
import 'home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomeView());

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;

  static List pages = [
    {
      'page': const HomePage(),
      'iconUrl': 'assets/icons/home-navbar.svg',
      'index': 0
    },
    {
      'page': const ReminderView(),
      'iconUrl': 'assets/icons/reminder-navbar.svg',
      'index': 1,
    },
    {
      'page': const Text('hello'),
      'iconUrl': 'assets/icons/home-navbar.svg',
      'index': 2,
    },
    {
      'page': const ChatScreen(),
      'iconUrl': 'assets/icons/chat-navbar.svg',
      'index': 3,
    },
    {
      'page': const CommunityScreen(),
      'iconUrl': 'assets/icons/community-navbar.svg',
      'index': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[_page]['page'],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          notchMargin: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (Map item in pages)
                item['index'] == 2
                    ? buildFab()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _page = item['index'];
                          });
                        },
                        child: SvgPicture.asset(
                          item['iconUrl'],
                          height: 40,
                          width: 40,
                          color: _page == item['index']
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

  buildFab() {
    return FloatingActionButton.small(
      backgroundColor: AppColors.kBlueColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0),
      ),
      onPressed: () {
        showAppBottomActionSheet(context);
      },
      child: const Center(
        child: Icon(
          Icons.add_circle_outline_rounded,
          size: 40.0,
        ),
      ),
    );
  }
}
