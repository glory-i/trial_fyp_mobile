import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trial_fyp_mobile/models/authentication/meal/mealplan.dart';
import 'package:trial_fyp_mobile/services/mealservices/mealServices.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/views/MealPlan/meal.dart';
import 'package:trial_fyp_mobile/widgets/generated_meal.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

import '../../models/authentication/loginResponseModel.dart';
import '../../models/authentication/meal/finalmealplan.dart';
import '../../models/authentication/meal/generateMealPlanRequest.dart';
import '../../models/authentication/meal/meal.dart';
import '../../services/authenticationServices/authenticationServices.dart';

class PlannedMeal extends StatefulWidget {
  late FinalMealPlan finalMealPlan;
  late String? duration;
  late GenerateMealPlanRequestModel? generateMealPlanRequestModel;
  PlannedMeal(
      {super.key,
      required this.finalMealPlan,
      required this.duration,
      required this.generateMealPlanRequestModel});

  @override
  State<PlannedMeal> createState() =>
      _PlannedMealState(finalMealPlan, duration, generateMealPlanRequestModel);
}

class _PlannedMealState extends State<PlannedMeal> {
  late FinalMealPlan finalMealPlan;
  late String? duration;
  late GenerateMealPlanRequestModel? generateMealPlanRequestModel;
  _PlannedMealState(
      this.finalMealPlan, this.duration, this.generateMealPlanRequestModel);

  late bool isLoading = false;

  final PageController _pageController = PageController();
  int currentIndex = 0;
  int currentDay = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: getProportionateScreenHeight(70),
        title: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: currentDay == 1
                    ? null
                    : () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        setState(() {
                          currentDay--;
                        });
                      },
                child: currentDay == 1
                    ? SvgPicture.asset(
                        "assets/group53.svg",
                        width: getProportionateScreenWidth(56),
                        height: getProportionateScreenHeight(51),
                      )
                    : SvgPicture.asset(
                        "assets/backButton4.svg",
                        width: getProportionateScreenWidth(56),
                        height: getProportionateScreenHeight(51),
                      ),
              ),
              Text(
                'Day $currentDay',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: currentIndex == finalMealPlan.mealPlans!.length - 1
                    ? null
                    : () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        setState(() {
                          currentDay++;
                        });
                        print(finalMealPlan.mealPlans!.length);
                        print(currentIndex);
                      },
                child: currentIndex == finalMealPlan.mealPlans!.length - 1
                    ? SvgPicture.asset(
                        "assets/group54.svg",
                        width: getProportionateScreenWidth(56),
                        height: getProportionateScreenHeight(51),
                      )
                    : SvgPicture.asset(
                        "assets/forwardButton.svg",
                        width: getProportionateScreenWidth(56),
                        height: getProportionateScreenHeight(51),
                      ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        //clipBehavior: Clip.none,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            SizedBox(
              height: getProportionateScreenHeight(1800),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: finalMealPlan.mealPlans!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Breakfast
                        const Text(
                          'BREAKFAST',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        GeneratedMeal(
                          onPressed: () =>
                                      moveToMealScreen(finalMealPlan.mealPlans![index].meals![0]),
                          meal: finalMealPlan.mealPlans![index].meals![0],
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Lunch
                        const Text(
                          'LUNCH',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        GeneratedMeal(
                          onPressed: () =>
                                      moveToMealScreen(finalMealPlan.mealPlans![index].meals![1]),
                          meal: finalMealPlan.mealPlans![index].meals![1],
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Dinner
                        const Text(
                          'DINNER',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        GeneratedMeal(
                          onPressed: () =>
                                      moveToMealScreen(finalMealPlan.mealPlans![index].meals![2]),
                          meal: finalMealPlan.mealPlans![index].meals![2],
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),

                        /// Totals
                        const Text(
                          'TOTALS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),

                        /// Calories
                        TotalsCard(
                          image: 'assets/caloriesImg.png',
                          totalName: 'Calories',
                          totalCalculation:
                              '${finalMealPlan.mealPlans![index].totalCalories.toString()}kcal',
                          color: 0xFF000000,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Carbs
                        TotalsCard(
                          image: 'assets/carbo.png',
                          totalName: 'Carbs',
                          totalCalculation:
                              '${finalMealPlan.mealPlans![index].totalCarbs.toString()}kg',
                          color: kErrorColor,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Protein
                        TotalsCard(
                          image: 'assets/proteinss.png',
                          totalName: 'Protein',
                          totalCalculation:
                              '${finalMealPlan.mealPlans![index].totalProtein.toString()}kg',
                          color: kGreenColor,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Fat
                        TotalsCard(
                          image: 'assets/fat.png',
                          totalName: 'Fats',
                          totalCalculation:
                              '${finalMealPlan.mealPlans![index].totalFat.toString()}kg',
                          color: kBlueColor,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Cost
                        TotalsCard(
                          image: 'assets/cost.png',
                          totalName: 'Cost',
                          totalCalculation:
                              '₦${finalMealPlan.mealPlans![index].totalCost.toString()}',
                          color: 0xFF000000,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        // Fitness
                        TotalsCard(
                          image: 'assets/fitness.png',
                          totalName: 'Fitness score',
                          totalCalculation:
                              '${finalMealPlan.mealPlans![index].fitness.toString()}',
                          color: 0xFF000000,
                        ),
                        const Divider(
                          color: Color(kGreenColor),
                          height: 30,
                          thickness: 1,
                        ),

                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Pie Chart
                        const Text(
                          'Percent Calories From',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        PieChart(
                          dataMap: {
                            "Protein": finalMealPlan
                                .mealPlans![index].percentCalorieFromProtein!,
                            "Fat": finalMealPlan
                                .mealPlans![index].percentCalorieFromFat!,
                            "Carbs": finalMealPlan
                                .mealPlans![index].percentCalorieFromCarbs!,
                          },
                          colorList: const [
                            Color(kGreenColor),
                            Color(kBlueColor),
                            Color(kErrorColor),
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
                        SizedBox(height: getProportionateScreenHeight(50)),
                        isLoading
                            ? FLoadingScreen()
                            : GestureDetector(
                                onTap: () async {
                                  if (await hasInternetConnection()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var loginResponseModel =
                                        loginResponseModelFromJson(
                                            await getLoginResponse() ?? "");
                                    var apiResponse = await regenerateMealPlan(
                                        await getToken(),
                                        duration!,
                                        currentIndex.toString(),
                                        generateMealPlanRequestModel!);
                                    if (apiResponse!.message == failure) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      showErrorSnackBar(
                                          apiResponse.error!.message, context);
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      finalMealPlan.mealPlans![currentIndex] =
                                          mealPlanFromJson(
                                              json.encode(apiResponse.data));
                                    }
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showErrorSnackBar(
                                        "Failed to connect, Check your internet connection",
                                        context);
                                  }
                                },
                                child: FPrimaryButton(text: 'Regenerate'))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );

  }


    dynamic moveToMealScreen(Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealScreen(
              meal: meal,
            )));
  }
}

class TotalsCard extends StatelessWidget {
  const TotalsCard({
    super.key,
    required this.image,
    required this.totalName,
    required this.totalCalculation,
    required this.color,
  });

  final String image;
  final String totalName;
  final String totalCalculation;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: getProportionateScreenWidth(50),
            height: getProportionateScreenHeight(50),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                totalName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(color)),
              ),
              Text(
                totalCalculation,
                style: TextStyle(fontSize: 17, color: Color(color)),
              )
            ],
          )
        ],
      ),
    );
  }
}
