import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trial_fyp_mobile/models/authentication/validateModel.dart';
import 'package:trial_fyp_mobile/services/authenticationServices/authenticationServices.dart';
import 'package:trial_fyp_mobile/widgets/loading_indicator.dart';
import '../../size_config.dart';
import '../../utility/constants.dart';
import '../../utility/utility.dart';
import '../../widgets/primary_button.dart';
import 'authentication.dart';

class OTPScreen extends StatefulWidget {
  late ValidateModel validateModel;
  static const id = "/otpScreen";

  OTPScreen({super.key, required this.validateModel});

  @override
  State<OTPScreen> createState() => _OTPScreenState(validateModel);
}

int otp = 0;

class _OTPScreenState extends State<OTPScreen> {
  late ValidateModel validateModel;
  late bool isLoading = false;
  _OTPScreenState(this.validateModel);

  @override
  void initState() {
    //PLEASE DO NOT FORGET TO UNCOMMENT THIS WHEN THE TIME REACHES !!!!! ALSO THE ONE FOR RESEND CODEEEE
    sendOtp(validateModel.userName, validateModel.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(clipBehavior: Clip.none, children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(100),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                      0, getProportionateScreenWidth(20), 0),
                  child: const Text(
                    "Verify your Email\nAddress",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                      0, getProportionateScreenWidth(20), 0),
                  child: const Text(
                    "Enter the OTP Code Here",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 5,
                    textStyle: const TextStyle(color: Colors.white),
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      inactiveColor: Colors.grey,
                      activeColor: const Color(kPrimaryColor),
                      selectedColor: Colors.grey,
                      inactiveFillColor: Colors.grey,
                      selectedFillColor: Colors.grey,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        otp = int.parse(value);
                      });
                    },
                    onChanged: (value) {},
                  ),
                ),

                /* Container(
                        height: 60,
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                        width: 200,
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: Color(0XFF31990D), shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: const Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 16),),
                          onPressed: (){
                            
                          },   
                        ),
                      ), */

                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(80)),
                  child: GestureDetector(
                    onTap: () async {
                      //REMEBER TO REMOVE THIS RUBBISH OOO!!!!!!
                      if (otp == 11111) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CompleteRegister(
                                  validateModel: validateModel,
                                )));
                      }
                      // //call validate otp at the backend and pass otp
                      setState(() {
                        isLoading = true;
                      });
                      if (await hasInternetConnection()) {
                        var apiResponse = await validateOtp(otp.toString(),
                            validateModel.userName, validateModel.email);
                        if (apiResponse!.message == failure) {
                          setState(() {
                            isLoading = false;
                          });
                          showErrorSnackBar(
                              apiResponse.error!.message, context);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CompleteRegister(
                                    validateModel: validateModel,
                                  )));
                        }
                      } else {
                        showErrorSnackBar(
                            "Failed to connect, Please check your connection",
                            context);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: isLoading
                        ? const FLoadingScreen()
                        : const FPrimaryButton(text: "NEXT"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(75, 20, 0, 0),
                  child: Text(
                    "Didn't receive any code?",
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TextButton(
                  onPressed: () async {
                    //call the send email endpoint again
                    //PLEASEEE DO NOT FORGET TO UN COMMENT THIS ENDPOINT WHEN THE TIME SHOULD REACH
                    setState(() {
                      isLoading = true;
                    });

                    if (await hasInternetConnection()) {
                      var apiResponse =
                          await sendOtp(validateModel.userName, validateModel.email);
                      if (apiResponse!.message == failure) {
                        setState(() {
                          isLoading = false;
                        });
                        showErrorSnackBar(apiResponse.error!.message, context);
                      }

                      else{
                        setState(() {
                          isLoading = false;
                        });
                        showSuccessSnackBar("OTP has been resent",context);
                      }

                    }
                    else {
                      setState(() {
                        isLoading = false;
                      });

                      showErrorSnackBar(
                          "Failed to connect, Check your connection", context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: Text(
                      "RESEND NEW CODE",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF31990D),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: getProportionateScreenHeight(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  "assets/Rectangle10.svg",
                  height: 200,
                  width: 170,
                ),
              )),
          Positioned(
              right: 0,
              top: getProportionateScreenHeight(650),
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
              top: getProportionateScreenHeight(500),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  "assets/Rectangle12.svg",
                  height: 200,
                  width: 170,
                ),
              )),
        ]),
      ),
    );
  }
}
