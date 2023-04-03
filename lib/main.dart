import 'package:flutter/material.dart';
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
      //home: OTP(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none)),
    );
  }
}