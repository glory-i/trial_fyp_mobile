import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:trial_fyp_mobile/models/apiresponse/apiresponse.dart';
import 'package:trial_fyp_mobile/models/authentication/loginModel.dart';
import 'package:trial_fyp_mobile/models/authentication/signUpModel.dart';
import 'package:trial_fyp_mobile/models/authentication/validateModel.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

import '../../models/authentication/loginResponseModel.dart';

Map<String, String> headers = {
  'Content-Type':'application/json',
};

//method to validate endpoint 
  Future<ApiResponse?> checkValidations(ValidateModel model) async{
    const String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/Validate";
    try
    {

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: validateModelToJson(model),

      );
      print(response.body);
      var res = apiResponseFromJson(response.body);
      return res;
    }

    catch(e){
    print(e);
    return null;
    }
    
  }



  //method to signUp endpoint 
  Future<ApiResponse?> signUp(SignUpModel model) async{
    const String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/SignUp";
    try
    {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: signUpModelToJson(model),
      );
      print(response.body);
      var res = apiResponseFromJson(response.body);
      return res;
    }

    catch(e){
    print(e);
    return null;
    }
    
  }


//method to login 
  Future<LoginResponseModel?> login(LoginModel model) async{
    const String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/Login";
    // try
    // {
    //   var response = await http.post(
    //     Uri.parse(url),
    //     headers: headers,
    //     body: loginModelToJson(model),

    //   );
    //   print(response.body);
    //   //var res = apiResponseFromJson(response.body);

    //   var res = json.decode(response.body);
    



      

    // }

    // catch(e){
    // print(e);
    // return null;
    // }
    return http.post(Uri.parse(url), headers: headers, body: loginModelToJson(model)).then((dynamic res) async{
      if (res["message"] != "Sucessful" && res["error"]["message"] != null) {
        throw (res["error"]["message"]);
      }
      else {
        return LoginResponseModel.fromJson(res["data"]);

      }
    }).catchError((e) {
      print(e);
    });
    
  }


//method to store token received on Login 
void storeToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'token', value: token);
  print('JSON web Token stored successfully');
}



//method to retrieve token received on Login 
Future<String?> getToken() async {
  const storage = FlutterSecureStorage();
  String? jwt = await storage.read(key: 'token');
  print(jwt);
  return jwt;
}



//method to forgotPassword endpoint 
  Future<ApiResponse?> forgotPassword(String? email, String? newPassword, String? confirmPassword) async{
    const String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/ForgotPassword";
    Map<String, String?> queryParams = {
    'email': email,
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,
    };
    
    String queryString = Uri(queryParameters: queryParams).query;

    try
    {
      var response = await http.post(
        Uri.parse("$url?$queryString"),
        headers: headers,
      );
      
      print(response.body);
      var res = apiResponseFromJson(response.body);
      return res;
    }

    catch(e){
    print(e);
    return null;
    }
    
  }





//method to send otp
  Future<ApiResponse?> sendOtp(String? username, String? email) async{
    Map<String, String?> queryParams = {
    'username': username,
    'email': email,
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/SendOTP";
    try
    {

      var response = await http.post(
        Uri.parse("$url?$queryString"),
        headers: headers,
      );

      print(response.body);
      var res = apiResponseFromJson(response.body);
      //print(res.data);
      return res;
      //return null;

    }

    catch(e){
    print(e);
    return null;
    }
    
  }



//method to validate otp
  Future<ApiResponse?> validateOtp(String? inputPin, String? username, String? email) async{
    Map<String, dynamic> queryParams = {
    'inputPin' : inputPin,
    'username': username,
    'email': email,
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/ValidateOTP";
    try
    {

      var response = await http.post(
        Uri.parse("$url?$queryString"),
        headers: headers,

      );

      print(response.body);
      var res = apiResponseFromJson(response.body);
      return res;


    }

    catch(e){
    print(e);
    return null;
    }
    
  }

//method to validate userexists
  Future<ApiResponse?> validateUserExists(String? email) async{
    Map<String, dynamic> queryParams = {
    'email': email,
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String url = "http://gloryiweriebor-001-site1.dtempurl.com/api/Authentication/ValidateUserExists";
    try
    {
      var response = await http.post(
        Uri.parse("$url?$queryString"),
        headers: headers,
      );

      print(response.body);
      var res = apiResponseFromJson(response.body);
      return res;

    }

    catch(e){
    print(e);
    return null;
    }
    
  }



















void showErrorSnackBar(String? message, BuildContext context) 
{
  const backgroundColor = Color(KErrorColor);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      //padding: EdgeInsets.only(left: 20),
      content: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: getProportionateScreenHeight(100),
            margin:  EdgeInsets.all(getProportionateScreenHeight(20)),
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              message??"An error occured",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}



void showSuccessSnackBar(String? message, BuildContext context) 
{
  const backgroundColor = Color(kPrimaryColor);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      //padding: EdgeInsets.only(left: 20),
      content: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: getProportionateScreenHeight(100),
            margin:  EdgeInsets.all(getProportionateScreenHeight(20)),
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(
              message??"Successful",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}