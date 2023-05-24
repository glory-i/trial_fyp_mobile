import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class RequestUpdateScreen extends StatefulWidget {
  const RequestUpdateScreen({super.key});

  @override
  State<RequestUpdateScreen> createState() => _RequestUpdateScreenState();
}

class _RequestUpdateScreenState extends State<RequestUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "FOODIFIED",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/backbutton3.svg",
              width: getProportionateScreenWidth(56),
              height: getProportionateScreenHeight(51),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text("The meal plan is created based on the physiological information entered when creating your account.")
          ],
        ),
      )),
    );
  }
}
