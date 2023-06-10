import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/authentication/meal/budgetRange.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/services/mealservices/mealServices.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/views/MealPlan/budget.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

class CreateMealPlan extends StatefulWidget {
  const CreateMealPlan({super.key});

  @override
  State<CreateMealPlan> createState() => _CreateMealPlanState();
}

class _CreateMealPlanState extends State<CreateMealPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "FOODIFIED",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(clipBehavior: Clip.none, children: [
          Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(70),
              ),
              const Text(
                "No Available Meal Plans yet...",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              GestureDetector(
                onTap: () async {
                  //GO TO GET BUDGET FOR A DAY ENDPOINT
                  if (await hasInternetConnection()) {
                    var apiResponse = await getBudgetForDay();

                    if (apiResponse!.message == failure) {
                      showErrorSnackBar(apiResponse.error!.message, context);
                    } else {
                      var newlistOfBudgets =
                          budgetRangeFromJson(json.encode(apiResponse.data));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BudgetScreen(
                                newlistOfBudgets: newlistOfBudgets,
                              )));
                    }
                  } else {
                    showErrorSnackBar(
                        "Failed to connect, Check your internet connection",
                        context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(11),
                      0, getProportionateScreenWidth(11), 0),
                  child: const FPrimaryButton(
                    text: "Create Meal Plan for a day",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(56),
              ),
              GestureDetector(
                onTap: () async {
                  //GO TO GET BUDGET FOR A WEEK ENDPOINT
                  if (await hasInternetConnection()) {
                    var apiResponse = await getBudgetForWeek();

                    if (apiResponse!.message == failure) {
                      showErrorSnackBar(apiResponse.error!.message, context);
                    } else {
                      var newlistOfBudgets =
                          budgetRangeFromJson(json.encode(apiResponse.data));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BudgetScreen(
                                newlistOfBudgets: newlistOfBudgets,
                              )));
                    }
                  } else {
                    showErrorSnackBar(
                        "Failed to connect, Check your internet connection",
                        context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(11),
                      0, getProportionateScreenWidth(11), 0),
                  child: const FPrimaryButton(
                    text: "Create Meal Plan for a Week",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(56),
              ),
              GestureDetector(
                onTap: () async {
                  //GO TO GET BUDGET FOR A MONTH ENDPOINT
                  if (await hasInternetConnection()) {
                    var apiResponse = await getBudgetForMonth();

                    if (apiResponse!.message == failure) {
                      showErrorSnackBar(apiResponse.error!.message, context);
                    } else {
                      var newlistOfBudgets =
                          budgetRangeFromJson(json.encode(apiResponse.data));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BudgetScreen(
                                newlistOfBudgets: newlistOfBudgets,
                              )));
                    }
                  } else {
                    showErrorSnackBar(
                        "Failed to connect, Check your internet connection",
                        context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(11),
                      0, getProportionateScreenWidth(11), 0),
                  child: const FPrimaryButton(
                    text: "Create Meal Plan for a Month",
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              left: getProportionateScreenWidth(370),
              child: SvgPicture.asset(
                "assets/newrectangle11.svg",
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(300),
              )),
          Positioned(
              left: getProportionateScreenWidth(-140),
              top: getProportionateScreenHeight(500),
              child: SvgPicture.asset(
                "assets/Rectangle13.svg",
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(200),
              )),
          Positioned(
              left: getProportionateScreenWidth(370),
              top: getProportionateScreenHeight(530),
              child: SvgPicture.asset(
                "assets/newrectangle11.svg",
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(300),
              )),
        ])),
      ),
    );
  }
}
