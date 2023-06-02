import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/views/MealPlan/meal.dart';

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ClassCard(
                            image: proteinPNG,
                            foodClass: 'Protein',
                            foodWeight: '145-250kg',
                            color: kGreenColor,
                          ),
                          ClassCard(
                            image: carbsPNG,
                            foodClass: 'Carbs',
                            foodWeight: '145-250kg',
                            color: kErrorColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ClassCard(
                            image: fatPNG,
                            foodClass: 'Fat',
                            foodWeight: '145-250kg',
                            color: kBlueColor,
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      const Center(
                          child: Text(
                        'Recommended Percent Calories From',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Placeholder(
                        fallbackWidth: getProportionateScreenWidth(350),
                        fallbackHeight: getProportionateScreenHeight(350),
                      ),
                      SizedBox(height: getProportionateScreenHeight(50))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.image,
    required this.foodClass,
    required this.foodWeight,
    required this.color,
  });

  final String image;
  final String foodClass;
  final String foodWeight;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Image.asset(image),
          width: getProportionateScreenWidth(60),
          height: getProportionateScreenHeight(60),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodClass,
              style: TextStyle(
                  color: Color(color),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              foodWeight,
              style: TextStyle(color: Color(color), fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
