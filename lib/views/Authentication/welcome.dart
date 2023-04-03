import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[Column(
          children: 
        [
          SizedBox(height: getProportionateScreenHeight(153),),
          Image.asset("assets/fruits.png", height: getProportionateScreenHeight(292),),
          SizedBox(height: getProportionateScreenHeight(12),),
          const Text("FOODIFIED", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
          SizedBox(height: getProportionateScreenHeight(30),),
          const Text("Find an Affordable Meal Plan that's right for you", style: TextStyle(fontSize: 23, color: Color(0XFF747373)), textAlign: TextAlign.center,),
          SizedBox(height: getProportionateScreenHeight(30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already Have an Account?", style: TextStyle(fontSize: 20, color: Color(0XFF747373)),),
              TextButton(onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
              }, child: const Text("Login", style: TextStyle(color: Color(0XFF1E7D2D), fontSize: 20, decoration: TextDecoration.underline),))
            ],
          ),
      
          /*Container(
                width: getProportionateScreenWidth(249),
                height: getProportionateScreenWidth(59),
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Color(0XFF31990D), shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize:20),),
                  onPressed: (){
                    //push to sign up form
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                  },
                  
                ),
              )*/
            SizedBox(height: getProportionateScreenHeight(30),),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(80)),
                child: GestureDetector(
                  onTap: (){
                    //push to sign up form
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: const FPrimaryButton(text: "SIGN UP"),
                ),
              
              ),
          
                          
        ]),
        //add get proportional screen kini for both of them
        Positioned(left: 0, top: 10, child: Align(alignment: Alignment.bottomLeft,child: SvgPicture.asset("assets/Rectangle9.svg", height: 200, width: 170,),)),
        Positioned(right: 0, top: 55, child: Align(alignment: Alignment.bottomLeft,child: SvgPicture.asset("assets/Rectangle10.svg", height: 200, width: 170,),)),
        
        ],
      ),
    );
  }
}