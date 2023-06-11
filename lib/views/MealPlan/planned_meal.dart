import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/widgets/generated_meal.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

class PlannedMeal extends StatefulWidget {
  const PlannedMeal({super.key});

  @override
  State<PlannedMeal> createState() => _PlannedMealState();
}

class _PlannedMealState extends State<PlannedMeal> {
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
                onTap: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  setState(() {
                    currentDay--;
                  });
                },
                child: SvgPicture.asset(
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
                onTap: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  setState(() {
                    currentDay++;
                  });
                },
                child: SvgPicture.asset(
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
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            SizedBox(
              height: getProportionateScreenHeight(1500),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
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
                          onPressed: () {},
                          image: 'assets/garriImage.png',
                          mealName: 'Cassava Flakes and Groundnut',
                          mealAmount: '1000',
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
                          onPressed: () {},
                          image: 'assets/garriImage.png',
                          mealName: 'Fried Rice and Meat with Sausage and Egg',
                          mealAmount: '1000',
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
                          onPressed: () {},
                          image: 'assets/garriImage.png',
                          mealName: 'Cassava Flakes and Groundnut',
                          mealAmount: '1000',
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
                        const TotalsCard(
                          image: 'assets/caloriesImg.png',
                          totalName: 'Calories',
                          totalCalculation: '1890 kcal',
                          color: 0xFF000000,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Carbs
                        const TotalsCard(
                          image: 'assets/carbo.png',
                          totalName: 'Carbs',
                          totalCalculation: '1890 kg',
                          color: kErrorColor,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Protein
                        const TotalsCard(
                          image: 'assets/proteinss.png',
                          totalName: 'Protein',
                          totalCalculation: '1890 kcal',
                          color: kGreenColor,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Fat
                        const TotalsCard(
                          image: 'assets/fat.png',
                          totalName: 'Fats',
                          totalCalculation: '1890 kg',
                          color: kBlueColor,
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),

                        /// Cost
                        const TotalsCard(
                          image: 'assets/cost.png',
                          totalName: 'Cost',
                          totalCalculation: '2500.0',
                          color: 0xFF000000,
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
                        const PieChart(
                          dataMap: {
                            "Protein": 30,
                            "Fat": 30,
                            "Carbs": 40,
                          },
                        ),
                        SizedBox(height: getProportionateScreenHeight(50)),
                        FPrimaryButton(text: 'Regenerate')
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
