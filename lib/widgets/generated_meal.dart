import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';

import '../models/authentication/meal/meal.dart';

class GeneratedMeal extends StatelessWidget {
  const GeneratedMeal({
    super.key,
    required this.meal,
    required this.onPressed,
  });

  final Meal meal;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(meal.flutterImageUrl!,
                          width: getProportionateScreenWidth(100),
                height: getProportionateScreenHeight(100),)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(60),
                child: Text(
                  meal.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Text(meal.cost!.toString())
            ],
          ),
          SvgPicture.asset(
            "assets/backButton5.svg",
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenHeight(40),
          ),
        ],
      ),
    );
  }
}
