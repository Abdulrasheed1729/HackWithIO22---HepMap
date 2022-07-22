import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_with_io/app/utils/utils.dart';
import 'package:hack_with_io/chat%20(todo)/chat.dart';
import 'package:hack_with_io/community/community.dart';
import 'package:hack_with_io/reminder/views/views.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15.0,
        bottom: 0.0,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const HomeTopBar(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              ActionsCard(
                text: 'Add a\nSymptom',
                iconUrl: 'assets/add-symptom-small.svg',
              ),
              SizedBox(width: 10),
              ActionsCard(
                text: 'See a\nSpecialist',
                iconUrl: 'assets/specialist-icon.svg',
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Today\'s dosage',
            style: kHeaderTaglineTextStyle.copyWith(
              color: AppColors.kBlackColor,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                DosageCard(
                  text: 'Velpatasvir',
                  numberOftablets: 2,
                  colour: AppColors.kOrangeShade,
                ),
                DosageCard(
                  text: 'Solvadi',
                  numberOftablets: 1,
                  colour: AppColors.kBlueShade,
                ),
                DosageCard(
                  text: 'Glecaprevir',
                  numberOftablets: 2,
                  colour: AppColors.kOrangeShade,
                ),
                DosageCard(
                  text: 'Glecaprevir',
                  numberOftablets: 2,
                  colour: AppColors.kBlueShade,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'My Tips',
            style: kHeaderTaglineTextStyle.copyWith(
              color: AppColors.kBlackColor,
            ),
          ),
          const SizedBox(height: 5),
          TipsCard(
            colour: AppColors.kYellowShade,
            text: 'Getting your friends\nand family vaccinated',
            imageUrl: 'assets/vaccine.svg',
          ),
          TipsCard(
            colour: AppColors.kBlueShade,
            text: 'Understanding your\nemotions',
            imageUrl: 'assets/emotions.svg',
          ),
          TipsCard(
            colour: AppColors.kYellowShade,
            text: 'Safe exercise tips\nand guidelines',
            imageUrl: 'assets/exercise.svg',
          ),
          TipsCard(
            colour: AppColors.kOrangeShade,
            text: 'Home-made healthy\ndrinks',
            imageUrl: 'assets/health-drinks.svg',
          ),
        ],
      ),
    );
  }
}

class TipsCard extends StatelessWidget {
  const TipsCard({
    Key? key,
    required this.colour,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  final String text;
  final String imageUrl;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: kTaglineTextStyle.copyWith(
                      color: AppColors.kBlackColor,
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    imageUrl,
                    height: 90,
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DosageCard extends StatefulWidget {
  const DosageCard({
    Key? key,
    required this.colour,
    required this.numberOftablets,
    required this.text,
  }) : super(key: key);

  final String text;
  final int numberOftablets;
  final Color colour;

  @override
  State<DosageCard> createState() => _DosageCardState();
}

class _DosageCardState extends State<DosageCard> {
  String iconUrl = 'assets/dosage-check button1.svg';
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: widget.colour,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: kHeaderTaglineTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.numberOftablets} tablets',
                textAlign: TextAlign.center,
                style: kHeaderTaglineTextStyle.copyWith(
                  color: AppColors.kBlackColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // iconUrl = 'assets/dosage-check button2.svg';
                    _isChecked = !_isChecked;
                    // print(iconUrl);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SvgPicture.asset(
                    _isChecked
                        ? 'assets/dosage-check button2.svg'
                        : 'assets/dosage-check button1.svg',
                    height: 40,
                    width: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HepMap',
              style: kSmallLogoTextStyle.copyWith(
                color: AppColors.kBlueColor,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Hello, Bayo!',
              style: kHeaderTaglineTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/Bayo.jpg'),
          radius: 25.0,
        ),
      ],
    );
  }
}

class ActionsCard extends StatelessWidget {
  const ActionsCard({
    Key? key,
    required this.iconUrl,
    required this.text,
  }) : super(key: key);

  final String text;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconUrl,
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: kHeaderTaglineTextStyle.copyWith(
                color: AppColors.kBlackColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
