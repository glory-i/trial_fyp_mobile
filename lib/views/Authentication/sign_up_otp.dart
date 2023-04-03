/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/widgets/otp_container.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late int? otp;
  late String string_otp = '';
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  bool otpFilled = false;

      TextEditingController controller1 = TextEditingController();
      TextEditingController controller2 = TextEditingController();
      TextEditingController controller3 = TextEditingController();
      TextEditingController controller4 = TextEditingController();
      TextEditingController controller5 = TextEditingController();
      TextEditingController controller6 = TextEditingController();

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
                  getProportionateScreenWidth(20), 0),
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
              padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
                  getProportionateScreenWidth(20), 0),
              child: const Text(
                "Enter the OTP Code Here",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Form(
                key: _otpFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTPContainer(textEditingController: controller1),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                      width: 200,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0XFF31990D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            "NEXT",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            if (_otpFormKey.currentState!.validate()) {
                              _otpFormKey.currentState!.save();
                              print(int.parse(string_otp));
                              string_otp = '';
                            }
                          }),
                    ),
                  ],
                )),
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
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Text(
                  "RESEND NEW CODE",
                  style: TextStyle(fontSize: 23, color: Color(0XFF31990D)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

 */