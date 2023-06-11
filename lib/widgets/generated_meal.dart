import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';

class GeneratedMeal extends StatelessWidget {
  const GeneratedMeal({
    super.key,
    required this.image,
    required this.mealName,
    required this.mealAmount,
    required this.onPressed,
  });

  final String image;
  final String mealName;
  final String mealAmount;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(50),
                child: Text(
                  mealName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Text(mealAmount)
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
