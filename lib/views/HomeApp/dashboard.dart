import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial_fyp_mobile/models/authentication/loginResponseModel.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/services/mealservices/mealServices.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/views/Authentication/authentication.dart';
import 'package:trial_fyp_mobile/views/HomeApp/searchResults.dart';
import 'package:trial_fyp_mobile/views/MealPlan/meal.dart';

import '../../models/authentication/meal/listOfMeal.dart';
import '../../models/authentication/meal/meal.dart';
import '../../utility/utility.dart';

enum MealTime { breakfast, lunch, dinner }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  LoginResponseModel? loginResponseModel;
  List<Meal>? listOfMeals;
  bool isLoading = true;
  MealTime? selectedMealTime;

  final searchController = TextEditingController();
  List<Meal>? listOfSearchedMeals;

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
    getLoginResponseData();
    getBreakfasts();
  }

  Future<void> getLoginResponseData() async {
    loginResponseModel =
        loginResponseModelFromJson(await getLoginResponse() ?? "");
    // setState(() {
    //   isLoading = false;
    // });
  }

  Future<void> getBreakfasts() async {
    if (await hasInternetConnection()) {
      var apiResponse = await getPopularBreakfasts();
      if (apiResponse!.message == failure) {
        setState(() {
          isLoading = false;
        });
        showErrorSnackBar(apiResponse.error!.message, context);
      } else {
        listOfMeals = mealsFromJson(json.encode(apiResponse.data));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      showErrorSnackBar(
          "Failed to connect, Check your internet connection", context);
    }
  }

  Future<void> getLunches() async {
    if (await hasInternetConnection()) {
      var apiResponse = await getPopularLunches();
      if (apiResponse!.message == failure) {
        setState(() {
          isLoading = false;
        });
        showErrorSnackBar(apiResponse.error!.message, context);
      } else {
        listOfMeals = mealsFromJson(json.encode(apiResponse.data));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      showErrorSnackBar(
          "Failed to connect, Check your internet connection", context);
    }
  }

  Future<void> getDinners() async {
    if (await hasInternetConnection()) {
      var apiResponse = await getPopularDinner();
      if (apiResponse!.message == failure) {
        setState(() {
          isLoading = false;
        });
        showErrorSnackBar(apiResponse.error!.message, context);
      } else {
        listOfMeals = mealsFromJson(json.encode(apiResponse.data));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      showErrorSnackBar(
          "Failed to connect, Check your internet connection", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const CircularProgressIndicator()
          : SafeArea(
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      Text(
                        isLoading
                            ? "Welcome"
                            : 'Welcome ${loginResponseModel!.userName}',
                        style: const TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          if (await hasInternetConnection()) {
                                  var apiResponse = await getSearchedMeals(
                                      searchController.text);
                                  if (apiResponse!.message == failure) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showErrorSnackBar(
                                        apiResponse.error!.message, context);
                                  }
                                  else{
                                  listOfSearchedMeals = mealsFromJson(
                                  json.encode(apiResponse.data));
                                  }

                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                         SearchResultsScreen(listOfSearchedMeals: listOfSearchedMeals!,
                                         searchString: searchController.text,
                                         )));

                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  showErrorSnackBar(
                                      "Failed to connect, Check your internet connection",
                                      context);
                                }

                        },
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search for a Meal",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () async {
                                if (await hasInternetConnection()) {
                                  var apiResponse = await getSearchedMeals(
                                      searchController.text);
                                  if (apiResponse!.message == failure) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showErrorSnackBar(
                                        apiResponse.error!.message, context);
                                  }
                                  else{
                                  listOfSearchedMeals = mealsFromJson(
                                  json.encode(apiResponse.data));
                                  }

                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                         SearchResultsScreen(listOfSearchedMeals: listOfSearchedMeals!,
                                         searchString: searchController.text,
                                         )));

                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  showErrorSnackBar(
                                      "Failed to connect, Check your internet connection",
                                      context);
                                }


                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      const Text(
                        'Popular Meals',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),

                      /// Meal Card
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MealTimeCard(
                              onPressed: () async {
                                setState(() {
                                  selectedMealTime = MealTime.breakfast;
                                });
                                await getBreakfasts();
                              },
                              text: 'Breakfast',
                              buttonColor:
                                  selectedMealTime == MealTime.breakfast
                                      ? const Color(kGreenColor)
                                      : const Color(kInactiveGreenColor),
                              textColor: selectedMealTime == MealTime.breakfast
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(width: getProportionateScreenWidth(30)),
                            MealTimeCard(
                              onPressed: () async {
                                setState(() {
                                  selectedMealTime = MealTime.lunch;
                                });
                                await getLunches();
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
                              onPressed: () async {
                                setState(() {
                                  selectedMealTime = MealTime.dinner;
                                });
                                await getDinners();
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
                      Container(
                        height: getProportionateScreenHeight(320),
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfMeals!.length,
                            separatorBuilder: (context, _) => SizedBox(
                                  width: getProportionateScreenWidth(30),
                                ),
                            itemBuilder: (context, index) => MealCard(
                                  meal: listOfMeals![index],
                                  onPressed: () =>
                                      moveToMealScreen(listOfMeals![index]),
                                )),
                      ),

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       MealCard(
                      //         image: 'assets/jollofRice',
                      //         foodName: 'Fried Rice',
                      //         amount: '₦1000',
                      //         calories: '450 kcal',
                      //       ),
                      //       SizedBox(width: getProportionateScreenWidth(30)),
                      //       MealCard(
                      //         image: 'assets/jollofRice',
                      //         foodName: 'Fried Rice',
                      //         amount: '₦1000',
                      //         calories: '450 kcal',
                      //       ),
                      //       SizedBox(width: getProportionateScreenWidth(30)),
                      //       MealCard(
                      //         image: 'assets/jollofRice',
                      //         foodName: 'Fried Rice',
                      //         amount: '₦1000',
                      //         calories: '450 kcal',
                      //       ),
                      //       SizedBox(width: getProportionateScreenWidth(30)),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
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

class MealCard extends StatelessWidget {
  const MealCard(
      {super.key,
      this.onPressed,
      // required this.image,
      // required this.foodName,
      // required this.amount,
      // required this.calories,
      required this.meal});

  // final String image;
  // final String foodName;
  // final String amount;
  // final String calories;
  final Function()? onPressed;
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        //height: getProportionateScreenHeight(10),
        decoration: BoxDecoration(
          color: const Color(kLightGreeColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                meal.flutterImageUrl!,
                width: getProportionateScreenWidth(330),
                height: getProportionateScreenHeight(180),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(330),
              child: Text(
                meal.name!,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text("₦${meal.cost!.toString()}",
                style: const TextStyle(fontSize: 20)),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text("${meal.calories!.toString()} kcal",
                style: const TextStyle(fontSize: 20))
          ],
        ),
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
