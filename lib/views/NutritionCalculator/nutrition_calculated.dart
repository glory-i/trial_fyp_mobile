import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/views/MealPlan/meal.dart';

import '../../models/nutrition/nutritionResponseModel.dart';

class NutritionCalculated extends StatefulWidget {
  
  late NutritionCalculatorResponseModel nutritionResponseModel;
  NutritionCalculated({super.key, required this.nutritionResponseModel});
  static const id = '/nutritionCalulator';

  @override
  State<NutritionCalculated> createState() => _NutritionCalculatedState(nutritionResponseModel);
}

class _NutritionCalculatedState extends State<NutritionCalculated> {

  late NutritionCalculatorResponseModel nutritionResponseModel;
  _NutritionCalculatedState(this.nutritionResponseModel);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Protein": 30,
      "Carbs": 50,
      "Fat": 20,
    };
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        //height: 250,
                        decoration: const BoxDecoration(
                            color: Color(0xFFED7C2A),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.elliptical(250, 200),
                                right: Radius.elliptical(250, 200))),
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(35)),
                          margin: const EdgeInsets.all(40),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.elliptical(250, 150),
                                  right: Radius.elliptical(250, 150))),
                          child:  Center(
                            child: Text(
                              'TOTAL\n${nutritionResponseModel.totalCaloriesRequired}\nkcal',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          ClassCard(
                            image: proteinPNG,
                            foodClass: 'Protein',
                            foodWeight: '${nutritionResponseModel.minProteinRequired!.toInt().toString()}-${nutritionResponseModel.maxProteinRequired!.toInt().toString()}kg',
                            color: kGreenColor,
                          ),
                          ClassCard(
                            image: carbsPNG,
                            foodClass: 'Carbs',
                            foodWeight: '${nutritionResponseModel.minCarbsRequired!.toInt().toString()}-${nutritionResponseModel.maxCarbsRequired!.toInt().toString()}kg',
                            color: kErrorColor,
                          )
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          ClassCard(
                            image: fatPNG,
                            foodClass: 'Fat',
                            foodWeight: '${nutritionResponseModel.minFatRequired!.toInt().toString()}-${nutritionResponseModel.maxFatRequired!.toInt().toString()}kg',
                            color: kBlueColor,
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(50)),
                      const Center(
                          child: Text(
                        'Recommended Percent Calories From',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      // Placeholder(
                      //   fallbackWidth: getProportionateScreenWidth(350),
                      //   fallbackHeight: getProportionateScreenHeight(350),
                      // ),
                      PieChart(
                        dataMap: dataMap,
                        chartType: ChartType.disc,
                        colorList: const [
                          Color(kGreenColor),
                          Color(kErrorColor),
                          Color(kBlueColor)
                        ],
                        legendOptions: const LegendOptions(
                            legendTextStyle: TextStyle(fontSize: 20)),
                        chartValuesOptions: const ChartValuesOptions(
                            decimalPlaces: 0,
                            showChartValuesInPercentage: true,
                            showChartValueBackground: false,
                            chartValueStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
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
