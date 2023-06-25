import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../utility/utility.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key, required this.email});
  late String email;
  static const id = "/forgotPasswordScreen3";

  @override
  State<ChangePassword> createState() => _ChangePasswordState(email);
}

class _ChangePasswordState extends State<ChangePassword> {
  late String email;
  String? newPassword;
  String? confirmNewPassword;
  late bool isnewPasswordVisible = false;
  late bool isConfirmNewPasswordVisible = false;
  late bool isLoading = false;

  _ChangePasswordState(this.email);

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
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
                      "New Password",
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
                          return "Please Enter New Password";
                        }
                        return null;
                      },
                      obscureText: !isnewPasswordVisible,
                      controller: newPasswordController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          newPassword = (value);
                        });
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: isnewPasswordVisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                            onPressed: () {
                              if (!mounted) return;
                              setState(() {
                                isnewPasswordVisible = !isnewPasswordVisible;
                              });
                            }),
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
                        getProportionateScreenWidth(30), 0, 0, 0),
                    child: const Text(
                      "Confirm New Password",
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
                          return "Please Enter Confirm Password";
                        }
                        if (newPasswordController.text !=
                            confirmNewPasswordController.text) {
                          return "New Passord and Confirm Password do not match";
                        }
                        return null;
                      },
                      obscureText: !isConfirmNewPasswordVisible,
                      controller: confirmNewPasswordController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (confirmValue) {
                        if (!mounted) return;
                        setState(() {
                          confirmNewPassword = (confirmValue);
                        });
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: isConfirmNewPasswordVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                            onPressed: () {
                              if (!mounted) return;
                              setState(() {
                                isConfirmNewPasswordVisible =
                                    !isConfirmNewPasswordVisible;
                              });
                            }),
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
                          setState(() {
                            isLoading = true;
                          });

                          if (await hasInternetConnection()) {
                            //push to home page OR LOGIN PAGE after creating the account

                            var apiResponse = await forgotPassword(
                                email, newPassword, confirmNewPassword);
                            if (apiResponse!.message == failure) {
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              showErrorSnackBar(
                                  apiResponse.error!.message, context);
                            } else {
                              if (!mounted) return;
                              setState(() {
                                isLoading = false;
                              });

                              showSuccessSnackBar(
                                  "Successfully Changed Password", context);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/loginScreen',
                                  ModalRoute.withName('/onboardingScreen'));

                              //PUSH TO LOGIN
                            }
                          } else {
                            if (!mounted) return;
                            setState(() {
                              isLoading = false;
                            });
                            showErrorSnackBar(
                                "Failed to connect, Check your internet connection",
                                context);
                          }
                        }

                        // //after changing password, go to login page
                        // print(newPassword);
                        // print(confirmNewPassword);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const Login()));
                      },
                    ),
                  )
                ],
              ),
            ),
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
