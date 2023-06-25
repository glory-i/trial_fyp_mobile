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
import '../../models/authentication/meal/generateMealPlanRequest.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
};

//method to get popular breaksfasts
Future<ApiResponse?> getPopularBreakfasts() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/PopularBreakfast";

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

//method to get popular lunches
Future<ApiResponse?> getPopularLunches() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/PopularLunch";

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

//method to get popular dinners
Future<ApiResponse?> getPopularDinner() async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/PopularDinner";

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

//method to generate meal plan
Future<ApiResponse?> generateMealPlan(String? bearerToken, String duration,
    GenerateMealPlanRequestModel model) async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/GenerateMealPlan";

  Map<String, String?> queryParams = {
    'duration': duration,
  };

  Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${bearerToken!}',
  };

  String queryString = Uri(queryParameters: queryParams).query;

  try {
    var response = await http.post(
      Uri.parse("$url?$queryString"),
      headers: authorizedHeaders,
      body: generateMealPlanRequestModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}

//method to re-generate meal plan
Future<ApiResponse?> regenerateMealPlan(String? bearerToken, String duration,
    String index, GenerateMealPlanRequestModel model) async {
  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/RegenerateMealPlan";

  Map<String, String?> queryParams = {
    'duration': duration,
    'index': index,
  };

  Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${bearerToken!}',
  };

  String queryString = Uri(queryParameters: queryParams).query;

  try {
    var response = await http.post(
      Uri.parse("$url?$queryString"),
      headers: authorizedHeaders,
      body: generateMealPlanRequestModelToJson(model),
    );
    print(response.body);
    var res = apiResponseFromJson(response.body);
    return res;
  } catch (e) {
    print(e);
    return null;
  }
}

//method to get searched meals breaksfasts
Future<ApiResponse?> getSearchedMeals(String? search) async {
  Map<String, String?> queryParams = {
    'search': search,
  };

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  const String url =
      "http://gloryiweriebor-001-site1.dtempurl.com/api/Meal/SearchMeals";

  String queryString = Uri(queryParameters: queryParams).query;

  try {
    var response = await http.get(
      Uri.parse("$url?$queryString"),
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
