import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

import '../../widgets/primary_button.dart';
import 'otp.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    
    late bool isPasswordVisible = false;  late bool isConfirmPasswordVisible = false;
    
    //create controllers for every other textfield later
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

  
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
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
          child: Stack(
            clipBehavior: Clip.none,
            children:[
            Form(
            key: _formkey,
          
              child: Column(
                children: [
                
                  SizedBox(height: getProportionateScreenHeight(100)),
                  
                  SizedBox(
                    height: getProportionateScreenHeight(65),
                    width: getProportionateScreenWidth(351),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (String? value){
                        if(value!.isEmpty){return "Please Enter First Name";} return null;
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0XFFD3FBD2) ,
                        hintText: 'First Name',
                        //prefixIcon: Icon(Icons.person, color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: getProportionateScreenHeight(30)),
                  /// last name
                    SizedBox(
                    height: getProportionateScreenHeight(65),
                    width: getProportionateScreenWidth(351),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String? value){
                          if(value!.isEmpty){return "Please Enter Last Name";} return null;
                        },
                              
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(kPrimaryBackgroundColor) ,
                          hintText: 'Last Name',
                          //prefixIcon: Icon(Icons.person, color: Colors.grey,),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  
                  SizedBox(height: getProportionateScreenHeight(30)),
                  
                  ///username
                    SizedBox(
                    height: getProportionateScreenHeight(65),
                    width: getProportionateScreenWidth(351),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String? value){
                          if(value!.isEmpty){return "Please Enter Userame";} return null;
                        },
                              
                              
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0XFFD3FBD2) ,
                          hintText: 'Username',
                          //prefixIcon: Icon(Icons.account_circle, color: Colors.grey,),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                        ),
                      ),
                    ),

                  SizedBox(height: getProportionateScreenHeight(30)),
                  
                  ///email
                    SizedBox(
                    height: getProportionateScreenHeight(65),
                    width: getProportionateScreenWidth(351),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String? value){
                          if(value!.isEmpty){return "Please Enter Email";} return null;
                        },
                              
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0XFFD3FBD2) ,
                          hintText: 'Email',
                          //prefixIcon: Icon(Icons.email, color: Colors.grey,),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: getProportionateScreenHeight(30)),
                  /// password
                    SizedBox(
                      height: getProportionateScreenHeight(65),
                      width: getProportionateScreenWidth(351),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (String? value){
                          if(value!.isEmpty){return "Please Enter Password";} return null;
                        },
                              
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0XFFD3FBD2) ,
                          hintText: "Password",
                          //prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible? const Icon(Icons.visibility_off, color: Colors.grey,): const Icon(Icons.visibility, color: Colors.grey,),
                            onPressed:(){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            
                            ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)
                        ),
                      ),
                    ),
                    
                    SizedBox(height: getProportionateScreenHeight(30)),
                  ///confirm password
                    SizedBox(
                      height: getProportionateScreenHeight(65),
                      width: getProportionateScreenWidth(351),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        validator: (String? value){
                          if(value!.isEmpty){return "Please Enter Confirm Password";}
                          if(confirmPasswordController.text != passwordController.text){return "Passord and Confirm Password do not match";} 
                          return null;
                        },
                        obscureText: !isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0XFFD3FBD2) ,
                          hintText: "Confirm Password",
                          //prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                          suffixIcon: IconButton(
                            icon: isConfirmPasswordVisible? const Icon(Icons.visibility_off, color: Colors.grey,): const Icon(Icons.visibility, color: Colors.grey,),
                            onPressed:(){
                              setState(() {
                                isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              });
                            },
                            
                            ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)
                        ),
                      ),
                    ),
          
                  SizedBox(height: getProportionateScreenHeight(30)),
                  /// next button
                  /*Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    width: 200,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Color(0XFF31990D), shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: const Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 16),),
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          //call api to validate username, email(CheckValidations), etc. If invalid display the error message, if valid move to otp screen
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OTPScreen()));
                        }
                        
                      },   
                    ),
                  ),*/
                
                SizedBox(height: getProportionateScreenHeight(20),),
                Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(80)),
                child: GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                          //call api to validate username, email(CheckValidations), etc. If invalid display the error message, if valid move to otp screen
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OTPScreen()));
                        }
                  },
                  child: const FPrimaryButton(text: "NEXT"),
                ),
              
              ),



                ],
                
              ),
            ),

            Positioned(
                left: 0,
                top: getProportionateScreenHeight(650),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle9.svg",
                    height: getProportionateScreenHeight(150),
                    width: getProportionateScreenWidth(170),
                  ),
                )),
            Positioned(
                right: 0,
                top: getProportionateScreenHeight(0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    "assets/Rectangle10.svg",
                    height: getProportionateScreenHeight(200),
                    width: getProportionateScreenWidth(170),
                  ),
                )),
            
            ]
          ),
        ) ),
    );
  }
}














Widget buildTextBox(String hintText){
  return Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFD3FBD2) ,
                      hintText: hintText,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                );
                
}