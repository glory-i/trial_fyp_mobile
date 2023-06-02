import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';

class NutritionCalculated extends StatelessWidget {
  const NutritionCalculated({super.key});
  static const id = '/nutritionCalulator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nutrition Calculator',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                'Recommend daily \nCalorie Consumption',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
                width: double.infinity,
                //height: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFFED7C2A),
                    borderRadius: BorderRadius.circular(200)),
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  margin: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(200)),
                  child: const Center(
                    child: Text(
                      'TOTAL\n2,458\nkcal',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  Row(
                    children: [SvgPicture.asset('assets/proteinss.svg')],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
