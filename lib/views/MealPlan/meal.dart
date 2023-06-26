import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

import '../../models/authentication/meal/meal.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal? meal;

  @override
  State<MealScreen> createState() => _MealScreenState(meal);
}

//IDEALLY YOU WILL TAKE THE WHOLE MEAL AT ONCE
class _MealScreenState extends State<MealScreen> {
  final Meal? meal;

  _MealScreenState(this.meal);

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

                  width: double.infinity, //MAY COMMENT THIS OUT OO!!!
                  child: Image.network(
                    meal!.flutterImageUrl!,
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
                        meal!.name!,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Text(
                        meal!.description!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Text(
                        'Sold at : ${meal!.producer!}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconDetails(
                              title: "Calories",
                              value: "${meal!.calories.toString()}kcal",
                              imageString: calorieSVG),
                          SizedBox(
                            width: getProportionateScreenWidth(45),
                          ),
                          IconDetails(
                              title: "Cost",
                              value: "₦${meal!.cost.toString()}",
                              imageString: costSVG),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PictureDetails(
                              title: "Protein",
                              value: "${meal!.protein.toString()}g",
                              imageString: proteinPNG),
                          SizedBox(
                            width: getProportionateScreenWidth(45),
                          ),
                          PictureDetails(
                              title: "Carbs",
                              value: "${meal!.carbs.toString()}g",
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
                              value: "${meal!.fat.toString()}g",
                              imageString: fatPNG),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
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
