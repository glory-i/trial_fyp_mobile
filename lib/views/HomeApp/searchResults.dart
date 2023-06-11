import 'package:flutter/material.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';
import 'package:trial_fyp_mobile/widgets/generated_meal.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(30),
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'FOODIFIED',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Search for a Meal",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            GeneratedMeal(
              onPressed: () {},
              image: 'assets/garriImage.png',
              mealName: 'Cassava Flakes and Groundnut',
              mealAmount: '1000',
            ),
            const Divider(
              color: Color(kGreenColor),
              height: 30,
              thickness: 1,
            ),
          ],
        )),
      )),
    );
  }
}
