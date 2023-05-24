import 'package:flutter/material.dart';

import '../size_config.dart';
import '../utility/constants.dart';
class FLoadingScreen extends StatelessWidget {
  //final String text;
  const FLoadingScreen({
    //required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(18),horizontal: getProportionateScreenWidth(8) ),
      decoration:  BoxDecoration(color: const Color(kPrimaryColor), borderRadius: BorderRadius.circular(40,),),
      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Loading....", style: TextStyle(fontSize: 20, color: Colors.white),),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      const CircularProgressIndicator(color: Colors.white,),
                    ],
                  ),
    );
  }
}