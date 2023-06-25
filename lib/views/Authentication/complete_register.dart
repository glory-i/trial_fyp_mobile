import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/authentication/signUpModel.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

import '../../models/authentication/validateModel.dart';
import '../../services/authenticationServices/authenticationServices.dart';
import '../../utility/utility.dart';

class CompleteRegister extends StatefulWidget {
  static const id = "/completeRegisterScreen";

  late ValidateModel validateModel;
  CompleteRegister({super.key, required this.validateModel});

  @override
  State<CompleteRegister> createState() =>
      _CompleteRegisterState(validateModel);
}

class _CompleteRegisterState extends State<CompleteRegister> {
  late ValidateModel validateModel;
  late bool isLoading = false;
  _CompleteRegisterState(this.validateModel);

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
  bool isCheckboxEnabled = false;
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void updateButtonState() {
    if (!mounted) return;
    setState(() {
      if (_formkey.currentState!.validate()) {
        isCheckboxEnabled = true;
      } else {
        isCheckboxEnabled = false;
        isAgreed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "SIGN UP",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Age",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(40), 0, 0, 0),
                  //width: getProportionateScreenWidth(250),
                  decoration: BoxDecoration(
                    color: const Color(kPrimaryBackgroundColor),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.5,
                    child: DropdownButtonFormField2(
                      validator: (value) {
                        if (value == null) {
                          return "";
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
                        if (!mounted) return;
                        setState(() {
                          ageString = value as String;
                          age = int.parse(ageString!);
                          updateButtonState();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Gender",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(40), 0, 0, 0),
                  //width: getProportionateScreenWidth(250),
                  decoration: BoxDecoration(
                    color: const Color(kPrimaryBackgroundColor),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SizedBox(
                    width: SizeConfig.screenWidth! * 0.5,
                    child: DropdownButtonFormField2(
                      //underline: SizedBox(),
                      validator: (value) {
                        if (value == null) {
                          return "";
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
                        if (!mounted) return;
                        setState(() {
                          gender = value as String;
                          updateButtonState();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Weight",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(55),
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(40), 0, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(55),
                        width: SizeConfig.screenWidth! * 0.5,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          onChanged: (value) {
                            if (!mounted) return;
                            setState(() {
                              //WE NEED TO CHANGE THIS
                              if (value.isNotEmpty) {
                                weight = double.parse(value);
                              }

                              updateButtonState();
                            });
                          },
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(kPrimaryBackgroundColor),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Height",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  children: [
                    Container(
                      width: getProportionateScreenWidth(130),
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(40), 0, 0, 0),
                      //width: getProportionateScreenWidth(250),
                      decoration: BoxDecoration(
                        color: const Color(kPrimaryBackgroundColor),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: DropdownButtonFormField2(
                        validator: (value) {
                          if (value == null) {
                            return "";
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
                          if (!mounted) return;
                          setState(() {
                            feetString = value as String;
                            feet = double.parse(feetString!);
                            updateButtonState();
                          });
                        },
                      ),
                    ),
                    const Text(
                      " ft",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
                            return "";
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
                          if (!mounted) return;
                          setState(() {
                            inchesString = value as String;
                            inches = double.parse(inchesString!);
                            updateButtonState();
                          });
                        },
                      ),
                    ),
                    const Text(
                      " in",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Activity Level",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(40), 0, 0, 0),
                  //width: getProportionateScreenWidth(250),
                  decoration: BoxDecoration(
                    color: const Color(kPrimaryBackgroundColor),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SizedBox(
                    width: getProportionateScreenWidth(350),
                    child: DropdownButtonFormField2(
                      //underline: SizedBox(),
                      validator: (value) {
                        if (value == null) {
                          return "";
                        }
                        return null;
                      },
                      dropdownStyleData: const DropdownStyleData(
                          decoration: BoxDecoration(
                        color: Color(kPrimaryBackgroundColor),
                      )),
                      items: listOfActivityLevels.map(buildMenuItem).toList(),
                      value: activityLevel,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          activityLevel = value as String;
                          updateButtonState();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(50), 0, 0, 0),
                  child: const Text(
                    "Goal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(40), 0, 0, 0),
                  //width: getProportionateScreenWidth(250),
                  decoration: BoxDecoration(
                    color: const Color(kPrimaryBackgroundColor),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: SizedBox(
                    width: getProportionateScreenWidth(350),
                    child: DropdownButtonFormField2(
                      validator: (value) {
                        if (value == null) {
                          return "";
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
                        if (!mounted) return;
                        setState(() {
                          goal = value as String;
                          updateButtonState();
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(40), 0, 0, 0),
                      child: Transform.scale(
                        scale: 2.0,
                        child: Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: Colors.black,
                            activeColor: Color(kPrimaryBackgroundColor),
                            value: isAgreed,
                            onChanged: isCheckboxEnabled
                                ? (bool? value) {
                                    if (!mounted) return;
                                    setState(() {
                                      isAgreed = value!;
                                    });
                                  }
                                : null),
                      ),
                    ),
                    const Text(
                      "I agree to the ",
                      style: TextStyle(fontSize: 17),
                    ),
                    const Text(
                      "Terms and Conditions",
                      style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          color: Color(kPrimaryColor)),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: GestureDetector(
                    onTap: isAgreed == true
                        ? () async {
                            if (!mounted) return;
                            setState(() {
                              isLoading = true;
                            });

                            if (await hasInternetConnection()) {
                              //push to home page OR LOGIN PAGE after creating the account

                              var apiResponse = await signUp(SignUpModel(
                                  firstName: validateModel.firstName,
                                  lastName: validateModel.lastName,
                                  confirmPassword:
                                      validateModel.confirmPassword,
                                  password: validateModel.password,
                                  email: validateModel.email,
                                  userName: validateModel.userName,
                                  activityLevel: activityLevel,
                                  age: age,
                                  gender: gender,
                                  goal: goal,
                                  heightInFeet: feet,
                                  heightInInches: inches,
                                  weight: weight));
                              if (apiResponse!.message == failure) {
                                if (!mounted) return;
                                setState(() {
                                  isLoading = false;
                                });
                                showErrorSnackBar(
                                    apiResponse.error!.message, context);
                              } else {
                                if (!mounted) return;
                                setState(() {
                                  isLoading = false;
                                });

                                showSuccessSnackBar(
                                    "Successfully Created Account", context);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/loginScreen',
                                    ModalRoute.withName('/onboardingScreen'));

                                //PUSH TO LOGIN
                              }
                            } else {
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              showErrorSnackBar(
                                  "Failed to connect, Check your internet connection",
                                  context);
                            }
                          }
                        : null,
                    child: isAgreed
                        ? isLoading
                            ? const FLoadingScreen()
                            : const FPrimaryButton(text: "SIGN UP")
                        : Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(18),
                                horizontal: getProportionateScreenWidth(8)),
                            decoration: BoxDecoration(
                              color:
                                  const Color(kPrimaryColor).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
            ),
          ),
          // Positioned(
          //     right: 0,
          //     top: getProportionateScreenHeight(10),
          //     child: Align(
          //       alignment: Alignment.bottomLeft,
          //       child: SvgPicture.asset(
          //         "assets/Rectangle10.svg",
          //         height: 200,
          //         width: 170,
          //       ),
          //     )),
          // Positioned(
          //     left: 0,
          //     top: getProportionateScreenHeight(700),
          //     child: Align(
          //       alignment: Alignment.bottomLeft,
          //       child: SvgPicture.asset(
          //         "assets/Rectangle12.svg",
          //         height: 200,
          //         width: 170,
          //       ),
          //     )),
        ]),
      )),
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
