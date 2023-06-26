import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/apiresponse/apiresponse.dart';
import 'package:trial_fyp_mobile/models/authentication/updateUserModel.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';

import '../../models/authentication/applicationUser.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  //const UpdateProfileScreen({super.key});

  late ApplicationUser applicationUser;
  UpdateProfileScreen({super.key, required this.applicationUser});

  @override
  State<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState(applicationUser);
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late ApplicationUser applicationUser;
  late bool isLoading = false;
  _UpdateProfileScreenState(this.applicationUser);
  //INITIALIZE THESE VALUES TO THE USER'S CURRENT DETAILS PLEASE.
  late String? ageString;
  late int? age;
  late double? weight;

  late String? feetString;
  late double? feet;

  late String? inchesString;
  late double? inches;

  late String? activityLevel;
  late String? goal;

  @override
  void initState() {
    //IN THIS PLACE WE WIL GET THE USER'S DETAILS, AND INITIALIZE THE VALUES TO THE USER'S INFORMATION

    weight = applicationUser.weight;
    weightController.text = weight.toString();

    age = applicationUser.age;
    ageString = age.toString();

    feet = applicationUser.heightInFeet;
    feetString = (feet!.toInt()).toString();

    inches = applicationUser.heightInInches;
    inchesString = (inches!.toInt()).toString();

    activityLevel = applicationUser.userActivityLevel;
    goal = applicationUser.goal;

    super.initState();
  }

  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Update Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
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
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(50), 0, 0, 0),
                    child: const Text(
                      "Age",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    width: SizeConfig.screenWidth! * 0.5,
                    margin: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(40), 0, 0, 0),
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
                        if (!mounted) return;
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(50), 0, 0, 0),
                    child: const Text(
                      "Weight",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            //initialValue: weight.toString(),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a valid weight";
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
                              if (!mounted) return;
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            if (!mounted) return;
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
                            if (!mounted) return;
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
                    height: getProportionateScreenHeight(40),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(50), 0, 0, 0),
                    child: const Text(
                      "Activity Level",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          if (!mounted) return;
                          setState(() {
                            activityLevel = value as String;
                            //updateButtonState();
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          if (!mounted) return;
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
                        if (!mounted) return;
                        if (!mounted) return;
                        setState(() {
                          isLoading = true;
                        });

                        if (await hasInternetConnection()) {
                          var apiResponse = await updateAccount(
                              await getToken(),
                              UpdateUserModel(
                                  age: age,
                                  activityLevel: activityLevel,
                                  goal: goal,
                                  heightInFeet: feet,
                                  heightInInches: inches,
                                  weight: weight));

                          if (apiResponse!.message == failure) {
                            if (!mounted) return;
                            if (!mounted) return;
                            setState(() {
                              isLoading = false;
                            });
                            showErrorSnackBar(
                                apiResponse.error!.message, context);
                          } else {
                            if (!mounted) return;
                            if (!mounted) return;
                            setState(() {
                              isLoading = false;
                            });
                            showSuccessSnackBar(
                                "Successfully Updated Account", context);
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

                        //CALL UPDATE ACCOUNT ENDPOINT AND SEND BACK TO THE PROFILE SCREEN
                        //DO LOADING PAGE AND SUCCESS SNACKBAR BEFORE GOING BACK TO PREVIOUS PAGE
                        Navigator.pop(context, applicationUser);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(80),
                          0,
                          getProportionateScreenWidth(80),
                          0),
                      child: isLoading
                          ? const FLoadingScreen()
                          : const FPrimaryButton(text: "Save Changes"),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                  ),
                ],
              )),
          Positioned(
              left: getProportionateScreenWidth(370),
              child: SvgPicture.asset(
                "assets/newrectangle11.svg",
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(300),
              )),
          Positioned(
              left: getProportionateScreenWidth(-140),
              top: getProportionateScreenHeight(600),
              child: SvgPicture.asset(
                "assets/Rectangle13.svg",
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(200),
              )),
          Positioned(
              left: getProportionateScreenWidth(370),
              top: getProportionateScreenHeight(600),
              child: SvgPicture.asset(
                "assets/newrectangle11.svg",
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(300),
              )),
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

final listOfActivityLevels = [
  sedentary,
  slightlyActive,
  moderatelyActive,
  active,
  veryActive
];

final listOfGoals = [gainWeight, loseWeight, maintainWeight];

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
