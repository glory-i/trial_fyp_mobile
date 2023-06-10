// To parse this JSON data, do
//
//     final nutritionCalculatorResponseModel = nutritionCalculatorResponseModelFromJson(jsonString);

import 'dart:convert';

NutritionCalculatorResponseModel nutritionCalculatorResponseModelFromJson(String str) => NutritionCalculatorResponseModel.fromJson(json.decode(str));

String nutritionCalculatorResponseModelToJson(NutritionCalculatorResponseModel data) => json.encode(data.toJson());

class NutritionCalculatorResponseModel {
    double? totalCaloriesRequired;
    double? minProteinRequired;
    double? maxProteinRequired;
    double? minCarbsRequired;
    double? maxCarbsRequired;
    double? minFatRequired;
    double? maxFatRequired;

    NutritionCalculatorResponseModel({
        this.totalCaloriesRequired,
        this.minProteinRequired,
        this.maxProteinRequired,
        this.minCarbsRequired,
        this.maxCarbsRequired,
        this.minFatRequired,
        this.maxFatRequired,
    });

    factory NutritionCalculatorResponseModel.fromJson(Map<String, dynamic> json) => NutritionCalculatorResponseModel(
        totalCaloriesRequired: json["totalCaloriesRequired"]?.toDouble(),
        minProteinRequired: json["minProteinRequired"]?.toDouble(),
        maxProteinRequired: json["maxProteinRequired"]?.toDouble(),
        minCarbsRequired: json["minCarbsRequired"]?.toDouble(),
        maxCarbsRequired: json["maxCarbsRequired"]?.toDouble(),
        minFatRequired: json["minFatRequired"]?.toDouble(),
        maxFatRequired: json["maxFatRequired"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "totalCaloriesRequired": totalCaloriesRequired,
        "minProteinRequired": minProteinRequired,
        "maxProteinRequired": maxProteinRequired,
        "minCarbsRequired": minCarbsRequired,
        "maxCarbsRequired": maxCarbsRequired,
        "minFatRequired": minFatRequired,
        "maxFatRequired": maxFatRequired,
    };
}
