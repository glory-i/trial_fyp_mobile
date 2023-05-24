import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  //INITIALIZE THESE VALUES TO THE USER'S CURRENT DETAILS PLEASE.
  String? ageString;
  late int? age;
  late double? weight;

  String? feetString;
  late double? feet;

  String? inchesString;
  late double? inches;

  String? activityLevel;
  String? goal;

  @override
  void initState() {
    //IN THIS PLACE WE WIL GET THE USER'S DETAILS, AND INITIALIZE THE VALUES TO THE USER'S INFORMATION

    weight = 40;
    weightController.text = weight.toString();

    ageString = "19";
    age = 19;

    feetString = "5";
    feet = 5;

    inchesString = "10";
    inches = 10;

    activityLevel = sedentary;
    goal = maintainWeight;

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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
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
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        print(activityLevel);
                        print(goal);
                        print(weight);
                        print(age);
                        print(feet);
                        print(inches);

                        //CALL UPDATE ACCOUNT ENDPOINT AND SEND BACK TO THE PROFILE SCREEN
                        //DO LOADING PAGE AND SUCCESS SNACKBAR BEFORE GOING BACK TO PREVIOUS PAGE
                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(80),
                          0,
                          getProportionateScreenWidth(80),
                          0),
                      child: const FPrimaryButton(text: "Save Changes"),
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
