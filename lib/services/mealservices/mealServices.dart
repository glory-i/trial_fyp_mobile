import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:trial_fyp_mobile/models/apiresponse/apiresponse.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

import '../../models/authentication/loginResponseModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
};


//method to get budget for a day endpoint
Future<ApiResponse?> getBudgetForDay() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/GetBudgetForDay";

  try {
    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}




//method to get budget for a week endpoint
Future<ApiResponse?> getBudgetForWeek() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/GetBudgetForWeek";

  try {
    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}


//method to get budget for a week endpoint
Future<ApiResponse?> getBudgetForMonth() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/GetBudgetForMonth";

  try {
    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}