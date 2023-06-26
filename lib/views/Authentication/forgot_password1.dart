import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/utility/utility.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const id = "/forgotPasswordScreen1";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? userEmail;
  late bool isLoading = false;
  final TextEditingController userEmailController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(30), 0, 0, 0),
                    child: const Text(
                      "Enter your Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(30),
                        0,
                        getProportionateScreenWidth(30),
                        0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                      controller: userEmailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (!mounted) return;
                        if (!mounted) return;
                        setState(() {
                          userEmail = (value);
                        });
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(kPrimaryBackgroundColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(100),
                        0,
                        getProportionateScreenWidth(100),
                        0),
                    child: GestureDetector(
                      child: isLoading
                          ? const FLoadingScreen()
                          : const FPrimaryButton(text: "NEXT"),
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          if (!mounted) return;
                          if (!mounted) return;
                          setState(() {
                            isLoading = true;
                          });
                          if (await hasInternetConnection()) {
                            var apiResponse =
                                await validateUserExists(userEmail);
                            if (apiResponse!.message == failure) {
                              if (!mounted) return;
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              showErrorSnackBar(
                                  apiResponse.error!.message, context);
                            } else {
                              if (!mounted) return;
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPasswordOTP(
                                        email: userEmail!,
                                      )));
                            }
                          } else {
                            showErrorSnackBar(
                                "Failed to connect, check your internet connection",
                                context);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: 0,
                top: getProportionateScreenHeight(250),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle11.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
            Positioned(
                right: 0,
                top: getProportionateScreenHeight(570),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle11.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
            Positioned(
                left: 0,
                top: getProportionateScreenHeight(680),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle12.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
            Positioned(
                left: 0,
                top: getProportionateScreenHeight(370),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle12.svg",
                    height: 200,
                    width: 170,
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
