import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/authentication/meal/budgetRange.dart';
import 'package:trial_fyp_mobile/models/authentication/meal/finalmealplan.dart';
import 'package:trial_fyp_mobile/models/authentication/meal/generateMealPlanRequest.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/services/mealservices/mealServices.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/views/MealPlan/meal.dart';
import 'package:trial_fyp_mobile/views/MealPlan/planned_meal.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

import '../../models/authentication/loginResponseModel.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';

class BudgetScreen extends StatefulWidget {
  //const BudgetScreen({super.key});

  late List<BudgetRange> newlistOfBudgets;
  late String? duration;
  BudgetScreen(
      {super.key, required this.newlistOfBudgets, required this.duration});

  @override
  State<BudgetScreen> createState() =>
      _BudgetScreenState(newlistOfBudgets, duration);
}

class _BudgetScreenState extends State<BudgetScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late List<BudgetRange> newlistOfBudgets;
  late List<String> listOfBudgets;
  late String? duration;

  late bool isLoading = false;
  _BudgetScreenState(this.newlistOfBudgets, this.duration);

  String? minBudgetString;
  late double? minBudget;

  String? maxBudgetString;
  late double? maxBudget;

  String? budgetRangeString;

  @override
  void initState() {
    listOfBudgets = buildListOfBudget(newlistOfBudgets);
    super.initState();
  }

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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/backbutton3.svg",
              width: getProportionateScreenWidth(56),
              height: getProportionateScreenHeight(51),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(clipBehavior: Clip.none, children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(42)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(35),
                        0,
                        getProportionateScreenWidth(12),
                        0),
                    child: Image.asset(
                      "assets/moneybudget.png",
                      height: getProportionateScreenHeight(300),
                      width: getProportionateScreenWidth(367),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(39)),
                  const Text(
                    "What is your available budget?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(29),
                        0, getProportionateScreenWidth(34), 0),
                    //width: getProportionateScreenWidth(250),
                    decoration: BoxDecoration(
                      color: const Color(kPrimaryBackgroundColor),
                      borderRadius: BorderRadius.circular(40),
                    ),

                    child: DropdownButtonFormField2(
                      validator: (value) {
                        if (value == null) {
                          return "please select budget";
                        }
                        return null;
                      },
                      dropdownStyleData: DropdownStyleData(
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(40),
                              0,
                              getProportionateScreenWidth(40),
                              0),
                          decoration: const BoxDecoration(
                            color: Color(kPrimaryBackgroundColor),
                          )),
                      items: listOfBudgets.map(buildMenuItem).toList(),
                      value: budgetRangeString,
                      onChanged: (value) {
                        if (!mounted) return;
                        if (!mounted) return;
                        setState(() {
                          budgetRangeString = value as String;
                          minBudget =
                              double.parse(budgetRangeString!.split('-')[0]);
                          maxBudget =
                              double.parse(budgetRangeString!.split('-')[1]);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                  ),
                  GestureDetector(
                      onTap: () async {
                        //MAKE IT A FORM AND ADD THE VALIDATION SO THAT THE USER MUST SELECT A VALUE !!!!
                        //call the ENDPOINT TO GENERATE MEAL PLAN. PASS MIN BUDGET, MAX BUDGET AND THE CALORIE REQUIREMENTS WHICH WILL BE IN THE TOKEN.
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => MealScreen(
                        //           proteinValue: 99,
                        //           carbsValue: 12,
                        //           caloriesValue: 600,
                        //           fatValue: 11,
                        //           cost: 1200,
                        //           imageString: '',
                        //           mealDescription:
                        //               'One Portion of Jollof Rice and One Portion of Fried Rice and One cup of Moi Moi',
                        //           mealName:
                        //               'Jollof Rice and Fried Rice and Moi Moi	',
                        //         )));
                        if (_formkey.currentState!.validate()) {
                          if (!mounted) return;
                          if (!mounted) return;
                          setState(() {
                            isLoading = true;
                          });

                          if (await hasInternetConnection()) {
                            var loginResponseModel = loginResponseModelFromJson(
                                await getLoginResponse() ?? "");

                            var apiResponse = await generateMealPlan(
                                await getToken(),
                                duration!,
                                GenerateMealPlanRequestModel(
                                    calorieRequirements:
                                        loginResponseModel.calorieRequirement,
                                    maxBudget: maxBudget,
                                    minBudget: minBudget));

                            if (apiResponse!.message == failure) {
                              if (!mounted) return;
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              showErrorSnackBar(
                                  apiResponse.error!.message, context);
                            } else {
                              var finalMealPlan = finalMealPlanFromJson(
                                  json.encode(apiResponse.data));
                              if (!mounted) return;
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PlannedMeal(
                                        duration: duration,
                                        finalMealPlan: finalMealPlan,
                                        generateMealPlanRequestModel:
                                            GenerateMealPlanRequestModel(
                                                calorieRequirements:
                                                    loginResponseModel
                                                        .calorieRequirement,
                                                maxBudget: maxBudget,
                                                minBudget: minBudget),
                                      )));
                            }
                          } else {
                            if (!mounted) return;
                            if (!mounted) return;
                            setState(() {
                              isLoading = false;
                            });
                            showErrorSnackBar(
                                "Failed to connect, Check your internet connection",
                                context);
                          }

                          //WE WILL ADD THIS ONE LATER
                          //       if (!mounted) return;
//if(!mounted) return; setState(() {
                          //   isLoading = true;
                          // });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(74),
                            0,
                            getProportionateScreenWidth(68),
                            0),
                        child: isLoading
                            ? FLoadingScreen()
                            : FPrimaryButton(text: "NEXT"),
                      )),
                ],
              ),
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
          ]),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: const TextStyle(color: Colors.black, fontSize: 23),
      ));
}

List<String> buildListOfBudget(List<BudgetRange> newlistOfBudgetRange) {
  late List<String> listOfBudgetRange = [];

  for (int i = 0; i < newlistOfBudgetRange.length; i++) {
    listOfBudgetRange.add(
        "${newlistOfBudgetRange[i].minBudget}-${newlistOfBudgetRange[i].maxBudget}");
  }
  return listOfBudgetRange;
}


// ///THE LIST OF BUDGETS WILL BE GOTTEN FROM THE ENDPOINT O PLEASE.
// final listOfBudgets = [
//   '10000-15000',
//   '15000-20000',
//   '20000-25000',
//   '25000-30000',
// ];

