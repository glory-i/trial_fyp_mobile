// To parse this JSON data, do
//
//     final nutritionCalculatorRequestModel = nutritionCalculatorRequestModelFromJson(jsonString);

import 'dart:convert';

NutritionCalculatorRequestModel nutritionCalculatorRequestModelFromJson(String str) => NutritionCalculatorRequestModel.fromJson(json.decode(str));

String nutritionCalculatorRequestModelToJson(NutritionCalculatorRequestModel data) => json.encode(data.toJson());

class NutritionCalculatorRequestModel {
    int? age;
    String? gender;
    double? weight;
    double? heightInFeet;
    double? heightInInches;
    String? activityLevel;
    String? goal;

    NutritionCalculatorRequestModel({
        this.age,
        this.gender,
        this.weight,
        this.heightInFeet,
        this.heightInInches,
        this.activityLevel,
        this.goal,
    });

    factory NutritionCalculatorRequestModel.fromJson(Map<String, dynamic> json) => NutritionCalculatorRequestModel(
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"]?.toDouble(),
        heightInFeet: json["heightInFeet"]?.toDouble(),
        heightInInches: json["heightInInches"]?.toDouble(),
        activityLevel: json["activityLevel"],
        goal: json["goal"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "gender": gender,
        "weight": weight,
        "heightInFeet": heightInFeet,
        "heightInInches": heightInInches,
        "activityLevel": activityLevel,
        "goal": goal,
    };
}
