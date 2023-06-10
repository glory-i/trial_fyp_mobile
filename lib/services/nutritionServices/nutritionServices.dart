import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:trial_fyp_mobile/models/apiresponse/apiresponse.dart';
import 'package:trial_fyp_mobile/models/nutrition/nutritionRequestModel.dart';
import 'package:trial_fyp_mobile/size_config.dart';
import 'package:trial_fyp_mobile/utility/constants.dart';

import '../../models/authentication/loginResponseModel.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
};



//method to request for nutrition calculation endpoint
Future<ApiResponse?> calculateNutritionRequirements(NutritionCalculatorRequestModel model) async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Nutrition/CalculateNutritionRequirements";
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: nutritionCalculatorRequestModelToJson(model),
    );

    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}
