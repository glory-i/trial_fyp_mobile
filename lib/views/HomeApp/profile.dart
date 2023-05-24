import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/views/HomeApp/updateProfile.dart';
import 'package:trial_fyp_mobile/widgets/primary_button.dart';

import '../../utility/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  
  static const id = "/profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
                     
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
            children: [
              SvgPicture.asset(
                "assets/Ellipse18.svg",
              ),
              Positioned(
                left: getProportionateScreenWidth(149),
                top: getProportionateScreenHeight(106),
                child: SvgPicture.asset(
                  "assets/avatar.svg",
                ),
              )
            ],
          ),
          const Text(
            "Glory Iweriebor",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: 
                [
              const KProfileDetails(
                  title: "Email",
                  value: "felixified@gmail.com",
                  imageString: "assets/email.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Username",
                  value: "felixified",
                  imageString: "assets/usernameicon.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Gender",
                  value: "Male",
                  imageString: "assets/gendericon.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Age",
                  value: "19",
                  imageString: "assets/ageicon.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Weight",
                  value: "70kg",
                  imageString: "assets/weight2.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Height",
                  value: "150cm",
                  imageString: "assets/heighticon.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Activity Level",
                  value: "Sedentary",
                  imageString: "assets/activity.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              const KProfileDetails(
                  title: "Goal",
                  value: "Gain Weight",
                  imageString: "assets/newgoalicon.svg"),
              const Divider(
                color: Color(kPrimaryBackgroundColor),
                thickness: 3,
              ),
              SizedBox(height: getProportionateScreenHeight(20),),

              GestureDetector(
                onTap: (){
                  //CALL THE LOGOUT ENDPOINT THAT YOU CREATE
                },

                child: Padding(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(80), 0, getProportionateScreenWidth(80), 0),
                  child: const FLogoutButton(text: "LOGOUT"),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),)
              ],
              ),
            ),
          ),
        ],
      ),
    );
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
                Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 23),
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
