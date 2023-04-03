import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool isPasswordVisible = false;
  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("FOODIFIED", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
                      onTap: (){
                      Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/backbutton3.svg",
                        width: getProportionateScreenWidth(56),
                        height: getProportionateScreenHeight(51),
                      ),
                    ),
        ) ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              Image.asset(
                "assets/vegetables.png",
                height: getProportionateScreenHeight(230),
                width: getProportionateScreenWidth(290),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFD3FBD2),
                      hintText: "Username/email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFD3FBD2),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(34),),
              TextButton(
                  onPressed: () {
                    ///take you to forgot password screen
                    print('GLORY');
                    Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0XFF1E7D2D),
                        fontSize: 17,
                        decoration: TextDecoration.underline),
                  )),
              SizedBox(height: getProportionateScreenHeight(40),),
              /* Container(
                height: getProportionateScreenHeight(61),
                width: getProportionateScreenWidth(353),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFF31990D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    //push to home screen if successful, return error message if not succcessful.
                  },
                ),
              ), */

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
                child: GestureDetector(
                  onTap: (){
                    //push to home screen if successful, return error message if not succcessful.
                  },
                  child: const FPrimaryButton(text: "LOGIN"),
                ),
              
              ),

              SizedBox(height: getProportionateScreenHeight(70),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have an Account?",
                    style: TextStyle(fontSize: 20, color: Color(0XFF747373)),
                  ),
                  TextButton(
                      onPressed: () {
                        //push to sign up form
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Register()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0XFF1E7D2D),
                            fontSize: 20,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ]),
            Positioned(
                left: 0,
                top: getProportionateScreenHeight(40),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle9.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
            Positioned(
                right: 0,
                top: getProportionateScreenHeight(85),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle10.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
