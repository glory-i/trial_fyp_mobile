import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trial_fyp_mobile/size_config.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    Key? key,
    required this.carbsValue,
    required this.fatValue,
    required this.proteinValue,
    required this.imageString,
    required this.mealName,
    required this.mealDescription,
  }) : super(key: key);

  final String? carbsValue;
  final String? fatValue;
  final String? proteinValue;
  final String? imageString;
  final String? mealName;
  final String? mealDescription;

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://drive.google.com/uc?export=view&id=1Zl1F_pJaFMVdVJa_EQCsZc4Iaur8qXnM",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
            Expanded(flex: 1, child:
            Column(
              children: [
                Text("CHOICE WAFFLES")
              ],

            ))
          ],
        ),
      ),
       
    );
  }
}
