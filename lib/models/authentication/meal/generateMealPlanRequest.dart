// To parse this JSON data, do
//
//     final generateMealPlanRequestModel = generateMealPlanRequestModelFromJson(jsonString);

import 'dart:convert';

GenerateMealPlanRequestModel generateMealPlanRequestModelFromJson(String str) => GenerateMealPlanRequestModel.fromJson(json.decode(str));

String generateMealPlanRequestModelToJson(GenerateMealPlanRequestModel data) => json.encode(data.toJson());

class GenerateMealPlanRequestModel {
    double? minBudget;
    double? maxBudget;
    double? calorieRequirements;

    GenerateMealPlanRequestModel({
        this.minBudget,
        this.maxBudget,
        this.calorieRequirements,
    });

    factory GenerateMealPlanRequestModel.fromJson(Map<String, dynamic> json) => GenerateMealPlanRequestModel(
        minBudget: json["minBudget"]?.toDouble(),
        maxBudget: json["maxBudget"]?.toDouble(),
        calorieRequirements: json["calorieRequirements"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "minBudget": minBudget,
        "maxBudget": maxBudget,
        "calorieRequirements": calorieRequirements,
    };
}
