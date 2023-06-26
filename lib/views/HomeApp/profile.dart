import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/models/authentication/applicationUser.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/views/Authentication/login.dart';
import 'package:trial_fyp_mobile/views/HomeApp/updateProfile.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

import '../../models/authentication/loginResponseModel.dart';
import '../../services/authenticationServices/authenticationServices.dart';
import '../../utility/constants.dart';
import '../../utility/utility.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const id = "/profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApplicationUser? applicationUser;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    if (await hasInternetConnection()) {
      var apiResponse = await viewUser(await getToken());

      if (apiResponse!.message == failure) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
        showErrorSnackBar(apiResponse.error!.message, context);
      } else {
        applicationUser =
            applicationUserFromJson(json.encode(apiResponse.data));
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      }
    } else {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      showErrorSnackBar(
          "Failed to connect, Check your internet connection", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        actions: [
          GestureDetector(
            onTap: () {
              ////send to update profile screen
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpdateProfileScreen(
                        applicationUser: applicationUser!,
                      )));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(10),
                  right: getProportionateScreenWidth(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color(kSecondaryBackgroundColor),
              ),
              child: const Center(
                  child: Text(
                "EDIT",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/Ellipse_18.png",
                height: getProportionateScreenHeight(200),
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/avatar.svg",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  )
                ],
              ),
            ],
          ),
          Text(
            isLoading
                ? " "
                : "${applicationUser!.firstName} ${applicationUser!.lastName}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  KProfileDetails(
                      title: "Email",
                      value: isLoading ? " " : "${applicationUser!.email}",
                      imageString: "assets/email.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Username",
                      value: isLoading ? " " : "${applicationUser!.userName}",
                      imageString: "assets/usernameicon.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Gender",
                      value: isLoading ? " " : "${applicationUser!.gender}",
                      imageString: "assets/gendericon.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Age",
                      value: isLoading
                          ? " "
                          : "${applicationUser!.age.toString()}",
                      imageString: "assets/ageicon.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Weight",
                      value: isLoading
                          ? " "
                          : "${applicationUser!.weight.toString()} kg",
                      imageString: "assets/weight2.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Height",
                      value: isLoading
                          ? " "
                          : "${applicationUser!.heightInCm.toString()} cm",
                      imageString: "assets/heighticon.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Activity Level",
                      value: isLoading
                          ? " "
                          : "${applicationUser!.userActivityLevel}",
                      imageString: "assets/activity.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  KProfileDetails(
                      title: "Goal",
                      value: isLoading ? " " : "${applicationUser!.goal}",
                      imageString: "assets/newgoalicon.svg"),
                  const Divider(
                    color: Color(kPrimaryBackgroundColor),
                    thickness: 3,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      //CALL THE LOGOUT ENDPOINT THAT YOU CREATE
                      // Navigate back to the login screen
                      //Navigator.popUntil(context, ModalRoute.withName('/loginScreen'));
                      clearSecureStorage();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Login();
                        }),
                        (route) => false,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(80),
                          0,
                          getProportionateScreenWidth(80),
                          0),
                      child: const FLogoutButton(text: "LOGOUT"),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void clearSecureStorage() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.deleteAll();
  }
}

class KProfileDetails extends StatelessWidget {
  const KProfileDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.imageString,
  }) : super(key: key);

  final String? title;
  final String? value;
  final String? imageString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(30),
          getProportionateScreenHeight(20),
          0,
          getProportionateScreenHeight(20)),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(imageString!),
            SizedBox(
              width: getProportionateScreenWidth(14),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 23),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  value!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
