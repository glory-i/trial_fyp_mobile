import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/models/authentication/loginModel.dart';
import 'package:trial_fyp_mobile/models/authentication/loginResponseModel.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/views/HomeApp/home.dart';
import 'package:trial_fyp_mobile/views/HomeApp/profile.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../utility/utility.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const id = "/loginScreen";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final storage = const FlutterSecureStorage();

  late bool isPasswordVisible = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late bool isLoading = false;

  //create controllers for every other textfield later
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
          child: Stack(children: [
            Form(
              key: _formkey,
              child: Column(children: [
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
                    controller: usernameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter Username or Email";
                      }
                      return null;
                    },
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
                    controller: passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
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
                SizedBox(
                  height: getProportionateScreenHeight(34),
                ),
                TextButton(
                    onPressed: () {
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
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(40)),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));

                      // if (_formkey.currentState!.validate()) {
                      //   setState(() {
                      //     isLoading = true;
                      //   });

                      //   if (await hasInternetConnection()) {
                      //     //push to home page OR LOGIN PAGE after creating the account

                      //     var loginResponseModel = await login(LoginModel(
                      //         usernameOrEmail: usernameController.text,
                      //         password: passwordController.text));
                          
                      //       storeToken(loginResponseModel!.token!);
                      //       getToken();

                      //   //   if (apiResponse!.message == failure) {
                      //   //     setState(() {
                      //   //       isLoading = false;
                      //   //     });
                      //   //     showErrorSnackBar(
                      //   //         apiResponse.error!.message, context);
                      //   //   } else {
                      //   //     var loginResponseModel = loginResponseModelFromJson(apiResponse.data);
                      //   //     storeToken(loginResponseModel.token!);
                      //   //     getToken();



                      //   //     setState(() {
                      //   //       isLoading = false;
                      //   //     });

                      //   //     //push to home screen if successful, return error message if not succcessful
                      //   //     //push to homescreen
                      //   //     Navigator.of(context).push(MaterialPageRoute(
                      //   //         builder: (context) => const Home()));

                      //   //     //PUSH TO HOME SCREEN IF LOGIN SUCCESSFUL

                      //   //   }
                      //    }
                      //   else {
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //     showErrorSnackBar(
                      //         "Failed to connect, Check your internet connection",
                      //         context);
                      //   }
                      // }
                    },
                    child: isLoading
                        ? const FLoadingScreen()
                        : const FPrimaryButton(text: "LOGIN"),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(70),
                ),
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
            ),
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
