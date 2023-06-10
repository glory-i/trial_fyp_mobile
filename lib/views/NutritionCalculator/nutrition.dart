import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/nutrition/nutritionRequestModel.dart';
import 'package:trial_fyp_mobile/models/nutrition/nutritionResponseModel.dart';
import 'package:trial_fyp_mobile/services/nutritionServices/nutritionServices.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/views/NutritionCalculator/nutrition_calculated.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';

import '../../services/authenticationServices/authenticationServices.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';

class NutritionCalculatorScreen extends StatefulWidget {
  const NutritionCalculatorScreen({super.key});

  @override
  State<NutritionCalculatorScreen> createState() =>
      _NutritionCalculatorScreenState();
}

class _NutritionCalculatorScreenState extends State<NutritionCalculatorScreen> {
  String? ageString;
  late int? age;
  late double? weight;

  String? feetString;
  late double? feet;

  String? inchesString;
  late double? inches;

  String? activityLevel;
  String? goal;
  String? gender;

  bool isAgreed = false;
  bool isLoading = false;
  bool isCheckboxEnabled = false;
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(children: [
        Stack(
          children: [
            SvgPicture.asset(
              "assets/Ellipse18.svg",
            ),
            Positioned(
              left: getProportionateScreenWidth(55),
              top: getProportionateScreenHeight(106),
              child: Text(
                "Nutrition Calculator",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(40),
                      0, getProportionateScreenWidth(40), 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The values here will not save to your user profile, they are meant purely for experimental purposes.",
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      const Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        //width: getProportionateScreenWidth(250),
                        // margin: EdgeInsets.fromLTRB(
                        //     getProportionateScreenWidth(40), 0, 0, 0),
                        width: SizeConfig.screenWidth! * 0.5,
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryBackgroundColor),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: DropdownButtonFormField2(
                          //underline: SizedBox(),
                          validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          },
                          dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(
                            color: Color(kPrimaryBackgroundColor),
                          )),
                          items: listOfGenders.map(buildMenuItem).toList(),
                          value: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value as String;
                              //updateButtonState();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      const Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        width: SizeConfig.screenWidth! * 0.5,
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryBackgroundColor),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: DropdownButtonFormField2(
                          validator: (value) {
                            if (value == null) {
                              return "Please select a value";
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
                          items: listOfAges.map(buildMenuItem).toList(),
                          value: ageString,
                          onChanged: (value) {
                            setState(() {
                              ageString = value as String;
                              age = int.parse(ageString!);
                              //updateButtonState();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      const Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        height: getProportionateScreenHeight(55),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(55),
                              width: SizeConfig.screenWidth! * 0.5,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a value";
                                  }
                                  return null;
                                },
                                controller: weightController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    //WE NEED TO CHANGE THIS
                                    if (value.isNotEmpty) {
                                      weight = double.parse(value);
                                    }

                                    //updateButtonState();
                                  });
                                },
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color(kPrimaryBackgroundColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const Text(
                              " kg",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      const Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(130),
                            // margin: EdgeInsets.fromLTRB(
                            //     getProportionateScreenWidth(40), 0, 0, 0),
                            //width: getProportionateScreenWidth(250),
                            decoration: BoxDecoration(
                              color: const Color(kPrimaryBackgroundColor),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: DropdownButtonFormField2(
                              validator: (value) {
                                if (value == null) {
                                  return "Please select a value";
                                }
                                return null;
                              },
                              dropdownStyleData: DropdownStyleData(
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(5),
                                      0,
                                      getProportionateScreenWidth(5),
                                      0),
                                  decoration: const BoxDecoration(
                                    color: Color(kPrimaryBackgroundColor),
                                  )),
                              items: listOfFeet.map(buildMenuItem).toList(),
                              value: feetString,
                              onChanged: (value) {
                                setState(() {
                                  feetString = value as String;
                                  feet = double.parse(feetString!);
                                  //updateButtonState();
                                });
                              },
                            ),
                          ),
                          const Text(
                            " ft",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          Container(
                            width: getProportionateScreenWidth(130),
                            margin: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(10), 0, 0, 0),
                            //width: getProportionateScreenWidth(250),
                            decoration: BoxDecoration(
                              color: const Color(kPrimaryBackgroundColor),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: DropdownButtonFormField2(
                              //underline: SizedBox(),
                              validator: (value) {
                                if (value == null) {
                                  return "Please select a value";
                                }
                                return null;
                              },
                              dropdownStyleData: DropdownStyleData(
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(5),
                                      0,
                                      getProportionateScreenWidth(5),
                                      0),
                                  decoration: const BoxDecoration(
                                    color: Color(kPrimaryBackgroundColor),
                                  )),
                              items: listOfInches.map(buildMenuItem).toList(),
                              value: inchesString,
                              onChanged: (value) {
                                setState(() {
                                  inchesString = value as String;
                                  inches = double.parse(inchesString!);
                                  //updateButtonState();
                                });
                              },
                            ),
                          ),
                          const Text(
                            " in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      const Text(
                        "Activity Level",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        width: getProportionateScreenWidth(350),
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryBackgroundColor),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: DropdownButtonFormField2(
                          //underline: SizedBox(),
                          validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          },
                          dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(
                            color: Color(kPrimaryBackgroundColor),
                          )),
                          items:
                              listOfActivityLevels.map(buildMenuItem).toList(),
                          value: activityLevel,
                          onChanged: (value) {
                            setState(() {
                              activityLevel = value as String;
                              //updateButtonState();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      const Text(
                        "Goal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryBackgroundColor),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SizedBox(
                          width: getProportionateScreenWidth(350),
                          child: DropdownButtonFormField2(
                            validator: (value) {
                              if (value == null) {
                                return "Please select a value";
                              }
                              return null;
                            },
                            //underline: SizedBox(),
                            dropdownStyleData: const DropdownStyleData(
                                decoration: BoxDecoration(
                              color: Color(kPrimaryBackgroundColor),
                            )),
                            items: listOfGoals.map(buildMenuItem).toList(),
                            value: goal,
                            onChanged: (value) {
                              setState(() {
                                goal = value as String;
                                //updateButtonState();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(69),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            if (await hasInternetConnection()) {
                              var apiResponse =
                                  await calculateNutritionRequirements(
                                      NutritionCalculatorRequestModel(
                                activityLevel: activityLevel,
                                age: age,
                                goal: goal,
                                heightInFeet: feet,
                                gender: gender,
                                heightInInches: inches,
                                weight: weight,
                              ));

                              if (apiResponse!.message == failure) {
                                showErrorSnackBar(
                                    apiResponse.error!.message, context);
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                var nutritionResponseModel =
                                    nutritionCalculatorResponseModelFromJson(
                                        json.encode(apiResponse.data));
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NutritionCalculated(
                                          nutritionResponseModel:
                                              nutritionResponseModel,
                                        )));
                              }
                            } else {
                              showErrorSnackBar(
                                  "Failed to connect, Check your internet connection",
                                  context);
                              setState(() {
                                isLoading = false;
                              });
                            }

                            //CALL CALCULATE NUTRITIONAL REQUIREMENTS ENPOINT PLEASEEEE!!!
                            //DO LOADING PAGE AND SUCCESS SNACKBAR BEFORE GOING BACK TO PREVIOUS PAGE
                            //Navigator.pop(context);
                          }

                          //ASK CHIZARAM WHAT THAT LINE IS FOR
                          //Navigator.pushNamed(context, NutritionCalculated.id);
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(50),
                              0,
                              getProportionateScreenWidth(50),
                              0),
                          child: isLoading
                              ? const FLoadingScreen()
                              : const FPrimaryButton(text: "Calculate"),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                    ],
                  ),
                )),
          ),
        )
      ]),
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

final listOfAges = [
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26'
];

final listOfFeet = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
];

final listOfInches = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
];

final listOfGenders = [
  'Male',
  'Female',
];

final listOfActivityLevels = [
  sedentary,
  slightlyActive,
  moderatelyActive,
  active,
  veryActive
];

final listOfGoals = [gainWeight, loseWeight, maintainWeight];
