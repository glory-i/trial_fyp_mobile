import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/views/HomeApp/dashboard.dart';
import 'package:trial_fyp_mobile/views/HomeApp/profile.dart';
import 'package:trial_fyp_mobile/views/MealPlan/create_meal_plan.dart';
import 'package:trial_fyp_mobile/views/NutritionCalculator/nutrition.dart';

import '../../utility/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    DashboardScreen(),
    CreateMealPlan(),
    NutritionCalculatorScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ADD THE APP BAR TO OTHER SCREENS APART FOM THE PROFILE SCREEN
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "FOODIFIED",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      ),
      */

      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 2, color: Colors.green))),
        child: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedItemColor: const Color(kSelectedNavbarColor),
            type: BottomNavigationBarType.fixed,
            //backgroundColor: Color(kPrimaryBackgroundColor),

            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/homeicon2.svg",
                    width: getProportionateScreenWidth(37.5),
                    height: getProportionateScreenHeight(24.08),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/homeicon2.svg",
                    width: getProportionateScreenWidth(37.5),
                    height: getProportionateScreenHeight(24.08),
                    color: const Color(kSelectedNavbarColor),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/mealplanicon2.svg",
                    width: getProportionateScreenWidth(31.87),
                    height: getProportionateScreenHeight(28.33),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/mealplanicon2.svg",
                    width: getProportionateScreenWidth(37.5),
                    height: getProportionateScreenHeight(24.08),
                    color: const Color(kSelectedNavbarColor),
                  ),
                  label: 'Meal Plans'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: getProportionateScreenWidth(26.25),
                    height: getProportionateScreenHeight(30),
                    "assets/calculatoricon2.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/calculatoricon2.svg",
                    width: getProportionateScreenWidth(37.5),
                    height: getProportionateScreenHeight(24.08),
                    color: const Color(kSelectedNavbarColor),
                  ),
                  label: 'Calculator'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: getProportionateScreenWidth(33.21),
                    height: getProportionateScreenHeight(30.06),
                    "assets/profileicon2.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/profileicon2.svg",
                    width: getProportionateScreenWidth(37.5),
                    height: getProportionateScreenHeight(24.08),
                    color: const Color(kSelectedNavbarColor),
                  ),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
