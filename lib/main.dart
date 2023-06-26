import 'package:flutter/material.dart';
import 'package:trial_fyp_mobile/views/Authentication/otp.dart';
import 'package:trial_fyp_mobile/views/NutritionCalculator/nutrition_calculated.dart';
import 'views/Authentication/authentication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Onboarding(),
      routes: {
        Onboarding.id: (context) => const Onboarding(),
        //Login.id: (context) => const Login(),
        '/loginScreen': (context) => const Login(),
        //NutritionCalculated.id: (context) => NutritionCalculated(nutritionResponseModel: )
      },
      //home: OTP(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme:
            const InputDecorationTheme(border: InputBorder.none),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
