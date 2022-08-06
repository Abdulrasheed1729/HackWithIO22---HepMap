import 'package:flutter/material.dart';
import 'package:hack_with_io/configs/configs.dart';

import '../widgets/widgets.dart';

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
                iconUrl: 'assets/icons/add-symptom-small.svg',
              ),
              SizedBox(width: 10),
              ActionsCard(
                text: 'See a\nSpecialist',
                iconUrl: 'assets/icons/specialist-icon.svg',
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
            imageUrl: 'assets/illusts/vaccine.svg',
          ),
          TipsCard(
            colour: AppColors.kBlueShade,
            text: 'Understanding your\nemotions',
            imageUrl: 'assets/illusts/emotions.svg',
          ),
          TipsCard(
            colour: AppColors.kYellowShade,
            text: 'Safe exercise tips\nand guidelines',
            imageUrl: 'assets/illusts/exercise.svg',
          ),
          TipsCard(
            colour: AppColors.kOrangeShade,
            text: 'Home-made healthy\ndrinks',
            imageUrl: 'assets/illusts/health-drinks.svg',
          ),
        ],
      ),
    );
  }
}
