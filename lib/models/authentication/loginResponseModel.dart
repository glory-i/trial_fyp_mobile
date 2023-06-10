// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    String? token;
    String? tokenUser;
    DateTime? expiration;
    int? age;
    String? firstName;
    String? lastName;
    String? gender;
    double? weight;
    double? heightInCm;
    double? heightInFeet;
    double? heightInInches;
    int? activityLevel;
    String? userActivityLevel;
    String? goal;
    double? calorieRequirement;
    String? id;
    String? userName;
    String? normalizedUserName;
    String? email;
    String? normalizedEmail;
    bool? emailConfirmed;
    String? passwordHash;
    String? securityStamp;
    String? concurrencyStamp;
    dynamic phoneNumber;
    bool? phoneNumberConfirmed;
    bool? twoFactorEnabled;
    dynamic lockoutEnd;
    bool? lockoutEnabled;
    int? accessFailedCount;

    LoginResponseModel({
        this.token,
        this.tokenUser,
        this.expiration,
        this.age,
        this.firstName,
        this.lastName,
        this.gender,
        this.weight,
        this.heightInCm,
        this.heightInFeet,
        this.heightInInches,
        this.activityLevel,
        this.userActivityLevel,
        this.goal,
        this.calorieRequirement,
        this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        token: json["token"],
        tokenUser: json["tokenUser"],
        expiration: json["expiration"] == null ? null : DateTime.parse(json["expiration"]),
        age: json["age"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        weight: json["weight"].toDouble(),
        heightInCm: json["heightInCm"]?.toDouble(),
        heightInFeet: json["heightInFeet"].toDouble(),
        heightInInches: json["heightInInches"].toDouble(),
        activityLevel: json["activityLevel"],
        userActivityLevel: json["userActivityLevel"],
        goal: json["goal"],
        calorieRequirement: json["calorieRequirement"]?.toDouble(),
        id: json["id"],
        userName: json["userName"],
        normalizedUserName: json["normalizedUserName"],
        email: json["email"],
        normalizedEmail: json["normalizedEmail"],
        emailConfirmed: json["emailConfirmed"],
        passwordHash: json["passwordHash"],
        securityStamp: json["securityStamp"],
        concurrencyStamp: json["concurrencyStamp"],
        phoneNumber: json["phoneNumber"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        twoFactorEnabled: json["twoFactorEnabled"],
        lockoutEnd: json["lockoutEnd"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount: json["accessFailedCount"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "tokenUser": tokenUser,
        "expiration": expiration?.toIso8601String(),
        "age": age,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "weight": weight,
        "heightInCm": heightInCm,
        "heightInFeet": heightInFeet,
        "heightInInches": heightInInches,
        "activityLevel": activityLevel,
        "userActivityLevel": userActivityLevel,
        "goal": goal,
        "calorieRequirement": calorieRequirement,
        "id": id,
        "userName": userName,
        "normalizedUserName": normalizedUserName,
        "email": email,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "passwordHash": passwordHash,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
    };
}
