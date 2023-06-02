import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    Key? key,
    required this.carbsValue,
    required this.caloriesValue,
    required this.fatValue,
    required this.proteinValue,
    required this.cost,
    required this.imageString,
    required this.mealName,
    required this.mealDescription,
  }) : super(key: key);

  final double? carbsValue;
  final double? caloriesValue;
  final double? fatValue;
  final double? proteinValue;
  final double? cost;
  final String? imageString;
  final String? mealName;
  final String? mealDescription;

  @override
  State<MealScreen> createState() => _MealScreenState(carbsValue, caloriesValue,
      fatValue, proteinValue, cost, imageString, mealName, mealDescription);
}

//IDEALLY YOU WILL TAKE THE WHOLE MEAL AT ONCE
class _MealScreenState extends State<MealScreen> {
  final double? carbsValue;
  final double? caloriesValue;
  final double? fatValue;
  final double? proteinValue;
  final double? cost;
  final String? imageString;
  final String? mealName;
  final String? mealDescription;

  _MealScreenState(
      this.carbsValue,
      this.caloriesValue,
      this.fatValue,
      this.proteinValue,
      this.cost,
      this.imageString,
      this.mealName,
      this.mealDescription);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(clipBehavior: Clip.none, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(
                    "https://drive.google.com/uc?export=view&id=1Zl1F_pJaFMVdVJa_EQCsZc4Iaur8qXnM",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                      0, getProportionateScreenWidth(20), 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //concatenate the meal name and the meal producer so they know wehre to buy from
                      Text(
                        mealName!,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Text(
                        mealDescription!,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Color(kPrimaryBackgroundColor),
                  thickness: 3,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                      0, getProportionateScreenWidth(20), 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconDetails(
                              title: "Calories",
                              value: "${caloriesValue.toString()}kcal",
                              imageString: calorieSVG),
                          SizedBox(
                            width: getProportionateScreenWidth(45),
                          ),
                          IconDetails(
                              title: "Cost",
                              value: "₦${cost.toString()}",
                              imageString: costSVG),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        children: [
                          PictureDetails(
                              title: "Protein",
                              value: "${proteinValue.toString()}kg",
                              imageString: proteinPNG),
                          SizedBox(
                            width: getProportionateScreenWidth(45),
                          ),
                          PictureDetails(
                              title: "Carbs",
                              value: "${carbsValue.toString()}kg",
                              imageString: carbsPNG),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PictureDetails(
                              title: "Fat",
                              value: "${fatValue.toString()}kg",
                              imageString: fatPNG),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Positioned(
                left: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(20),
                child: SvgPicture.asset(
                  "assets/backbutton3.svg",
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(40),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class IconDetails extends StatelessWidget {
  const IconDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.imageString,
  }) : super(key: key);

  final String? title;
  final String? value;
  final String? imageString;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(imageString!),
          SizedBox(
            width: getProportionateScreenWidth(14),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                value!,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}

//same as ICON DETAILS BUT I NEEDED TO CREATE THIS ONE FOR PICTURES SPECIFICALLY
class PictureDetails extends StatelessWidget {
  const PictureDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.imageString,
  }) : super(key: key);

  final String? title;
  final String? value;
  final String? imageString;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenHeight(50),
              child: Image.asset(imageString!)),
          SizedBox(
            width: getProportionateScreenWidth(14),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                value!,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
