import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

enum MealTime { breakfast, lunch, dinner }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  MealTime? selectedMealTime;
  String availableMeals() {
    if (selectedMealTime == MealTime.breakfast) {
      return 'Breakfast';
    } else if (selectedMealTime == MealTime.lunch) {
      return "Lunch";
    } else {
      return "Dinner";
    }
  }

  @override
  void initState() {
    super.initState();
    selectedMealTime = MealTime.breakfast;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(30)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'FOODIFIED',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const Text(
                  'Welcome Glory,',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Searach for a Meal",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const Text(
                  'Popular Meals',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),

                /// Meal Card
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MealTimeCard(
                        onPressed: () {
                          setState(() {
                            selectedMealTime = MealTime.breakfast;
                          });
                        },
                        text: 'Breakfast',
                        buttonColor: selectedMealTime == MealTime.breakfast
                            ? const Color(kGreenColor)
                            : const Color(kInactiveGreenColor),
                        textColor: selectedMealTime == MealTime.breakfast
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: getProportionateScreenWidth(30)),
                      MealTimeCard(
                        onPressed: () {
                          setState(() {
                            selectedMealTime = MealTime.lunch;
                          });
                        },
                        text: 'Lunch',
                        buttonColor: selectedMealTime == MealTime.lunch
                            ? const Color(kGreenColor)
                            : const Color(kInactiveGreenColor),
                        textColor: selectedMealTime == MealTime.lunch
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: getProportionateScreenWidth(30)),
                      MealTimeCard(
                        onPressed: () {
                          setState(() {
                            selectedMealTime = MealTime.dinner;
                          });
                        },
                        text: 'Dinner',
                        buttonColor: selectedMealTime == MealTime.dinner
                            ? const Color(kGreenColor)
                            : const Color(kInactiveGreenColor),
                        textColor: selectedMealTime == MealTime.dinner
                            ? Colors.white
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MealCard(
                        image: 'assets/jollofRice',
                        foodName: 'Fried Rice',
                        amount: '₦1000',
                        calories: '450 kcal',
                      ),
                      SizedBox(width: getProportionateScreenWidth(30)),
                      MealCard(
                        image: 'assets/jollofRice',
                        foodName: 'Fried Rice',
                        amount: '₦1000',
                        calories: '450 kcal',
                      ),
                      SizedBox(width: getProportionateScreenWidth(30)),
                      MealCard(
                        image: 'assets/jollofRice',
                        foodName: 'Fried Rice',
                        amount: '₦1000',
                        calories: '450 kcal',
                      ),
                      SizedBox(width: getProportionateScreenWidth(30)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.image,
    required this.foodName,
    required this.amount,
    required this.calories,
  });

  final String image;
  final String foodName;
  final String amount;
  final String calories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
        color: Color(kLightGreeColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/jollofRice.png",
            width: getProportionateScreenWidth(330),
            height: getProportionateScreenHeight(180),
          ),
          Text(
            foodName,
            style: TextStyle(fontSize: 20),
          ),
          Text(amount, style: TextStyle(fontSize: 20)),
          Text(calories, style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}

class MealTimeCard extends StatelessWidget {
  const MealTimeCard({
    super.key,
    this.onPressed,
    required this.textColor,
    required this.buttonColor,
    required this.text,
  });

  final Function()? onPressed;
  final Color textColor;
  final Color buttonColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(35),
            vertical: getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}
