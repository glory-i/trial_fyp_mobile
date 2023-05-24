// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    String? firstName;
    String? lastName;
    String? userName;
    String? email;
    String? password;
    String? confirmPassword;
    int? age;
    String? gender;
    double? weight;
    double? heightInFeet;
    double? heightInInches;
    String? activityLevel;
    String? goal;

    SignUpModel({
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.password,
        this.confirmPassword,
        this.age,
        this.gender,
        this.weight,
        this.heightInFeet,
        this.heightInInches,
        this.activityLevel,
        this.goal,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        age: json["age"],
        gender: json["gender"],
        weight: json["weight"],
        heightInFeet: json["heightInFeet"],
        heightInInches: json["heightInInches"],
        activityLevel: json["activityLevel"],
        goal: json["goal"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "age": age,
        "gender": gender,
        "weight": weight,
        "heightInFeet": heightInFeet,
        "heightInInches": heightInInches,
        "activityLevel": activityLevel,
        "goal": goal,
    };
}
