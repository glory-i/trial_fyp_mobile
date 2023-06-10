// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
    int? age;
    double? weight;
    double? heightInFeet;
    double? heightInInches;
    String? activityLevel;
    String? goal;

    UpdateUserModel({
        this.age,
        this.weight,
        this.heightInFeet,
        this.heightInInches,
        this.activityLevel,
        this.goal,
    });

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        age: json["age"],
        weight: json["weight"]?.toDouble(),
        heightInFeet: json["heightInFeet"]?.toDouble(),
        heightInInches: json["heightInInches"]?.toDouble(),
        activityLevel: json["activityLevel"],
        goal: json["goal"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "weight": weight,
        "heightInFeet": heightInFeet,
        "heightInInches": heightInInches,
        "activityLevel": activityLevel,
        "goal": goal,
    };
}
