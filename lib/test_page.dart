import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_with_io/app/utils/colors.dart';

// List<PersistentBottomNavBarItem> _navBarItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         'assets/reminder-navbar.svg',
//         height: 50,
//         width: 50,
//       ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         'assets/reminder-navbar.svg',
//         height: 50,
//         width: 50,
//       ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         'assets/reminder-navbar.svg',
//         height: 50,
//         width: 50,
//       ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         'assets/reminder-navbar.svg',
//         height: 50,
//         width: 50,
//       ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: SvgPicture.asset(
//         'assets/reminder-navbar.svg',
//         height: 50,
//         width: 50,
//       ),
//     ),
//   ];
// }

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // late PersistentTabController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   // _controller = PersistentTabController(initialIndex: 0);
  // }

  int _currentPage = 0;
  final _pages = [
    const Text('Page 1'),
    const Text('Page 2'),
    const Text('Page 3'),
    const Text('Page 4'),
    const Text('Page 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentPage = 0;
                });
              },
              icon: SvgPicture.asset(
                'assets/chat-navbar.svg',
                height: 80,
                width: 80,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: _currentPage == 0
                    ? AppColors.kBlackColor
                    : Colors.grey.shade300,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentPage = 1;
                });
              },
              icon: SvgPicture.asset(
                'assets/chat-navbar.svg',
                height: 50,
                width: 50,
                color: _currentPage == 1
                    ? AppColors.kBlackColor
                    : Colors.grey.shade600,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentPage = 2;
                });
              },
              icon: SvgPicture.asset(
                'assets/add-symptom-small.svg',
                height: 55,
                width: 55,
                // color: _currentPage == 2
                //     ? AppColors.kBlackColor
                //     : Colors.grey.shade300,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentPage = 3;
                });
              },
              icon: SvgPicture.asset(
                'assets/chat-navbar.svg',
                height: 50,
                width: 50,
                color: _currentPage == 3
                    ? AppColors.kBlackColor
                    : Colors.grey.shade300,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentPage = 4;
                });
              },
              icon: SvgPicture.asset(
                'assets/chat-navbar.svg',
                height: 50,
                width: 50,
                color: _currentPage == 4
                    ? AppColors.kBlackColor
                    : Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
      body: Center(child: _pages[_currentPage]),
    );
  }
}
