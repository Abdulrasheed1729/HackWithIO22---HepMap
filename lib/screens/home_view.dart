import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/configs/configs.dart';
import 'package:hack_with_io/screens/chat_screen.dart';
import 'package:hack_with_io/screens/community_screen.dart';

import 'home_page.dart';
import 'reminder_screen.dart';

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
    // Container(),
    const ChatScreen(),
    const CommunityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: AppColors.kBlueColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.black.withOpacity(.5),
            backgroundColor: Colors.black.withOpacity(.0),
            clipBehavior: Clip.none,
            builder: (ctx) {
              return SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 25,
                    right: 25,
                    bottom: 10,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                //TODO Change the icon here.
                                SvgPicture.asset(
                                  'assets/add-symptom-small.svg',
                                  height: 30,
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/add-symptom-small.svg',
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            'Add Symptom',
                            style: kTaglineTextStyle.copyWith(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        //TODO Change the Icons for this
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/add-symptom-small.svg',
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            'Add Reminder',
                            style: kTaglineTextStyle.copyWith(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        //TODO Change the Icons for this
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/add-symptom-small.svg',
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            'Add Post',
                            style: kTaglineTextStyle.copyWith(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[_currentPage],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          notchMargin: 6.0,
          shape: const CircularNotchedRectangle(),
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
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       _currentPage = 2;
              //     });
              //   },
              //   child: SvgPicture.asset(
              //     'assets/add-symptom-small.svg',
              //     height: 45,
              //     width: 45,
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                  });
                },
                child: SvgPicture.asset(
                  'assets/chat-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 2
                      ? AppColors.kBlackColor
                      : Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentPage = 3;
                  });
                },
                child: SvgPicture.asset(
                  'assets/community-navbar.svg',
                  height: 35,
                  width: 35,
                  color: _currentPage == 3
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
