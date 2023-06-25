import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'authentication.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const id = "/onboardingScreen";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController _controller = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    if (!mounted) return;
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          //SvgPicture.asset("assets/eathealthy.png")
                          SizedBox(height: getProportionateScreenHeight(65)),
                          Image.asset(
                            contents[i].image,
                            height: getProportionateScreenHeight(386),
                          ),
                          SizedBox(height: getProportionateScreenHeight(36)),
                          Text(
                            contents[i].title,
                            style: mainTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(40),
                          ),
                          Text(
                            contents[i].description,
                            style: subTextStyle(),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => buildDot(index))),
            ),
            Container(
              height: getProportionateScreenHeight(60),
              margin: const EdgeInsets.fromLTRB(
                  0, 40, 0, 50), //get proportional screen
              width: 200, //get proportional screen
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0XFF31990D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  currentIndex == contents.length - 1 ? "CONTINUE" : "NEXT",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    //if "continue" navigate to the welcome screen
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Welcome()));
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                },
              ),
            )
          ],
        ),
        //get proportional screen
        Align(
          alignment: Alignment.bottomLeft,
          child: SvgPicture.asset(
            "assets/greenRectangle.svg",
            height: 170,
            width: 170,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            "assets/greenRectangleRight.svg",
            height: 120,
            width: 120,
          ),
        ),
      ]),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10, //get proportional
      width: currentIndex == index ? 30 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0XFF31990D)),
    );
  }
}

TextStyle mainTextStyle() {
  return TextStyle(fontSize: 31, fontWeight: FontWeight.bold);
}

TextStyle subTextStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
}

class OnboardingContent {
  late String image;
  late String title;
  late String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "assets/dietplan.png",
      title: "PLAN YOUR MEAL FOR \n THE DAY",
      description: "Remove the stress of planning what to eat every day"),
  OnboardingContent(
      image: "assets/eathealthy.png",
      title: "EAT AFFORDABLE, EAT HEALTHY",
      description:
          "Get affordable, healthy meal plans that are just right for you"),
  OnboardingContent(
      image: "assets/calculator.png",
      title: "CALCULATE NUTRITION REQUIREMENTS",
      description: "Find out how much nutrients you should be consuming daily"),
];
