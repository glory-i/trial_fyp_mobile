// To parse this JSON data, do
//
//     final validateModel = validateModelFromJson(jsonString);

import 'dart:convert';

ValidateModel validateModelFromJson(String str) => ValidateModel.fromJson(json.decode(str));

String validateModelToJson(ValidateModel data) => json.encode(data.toJson());

class ValidateModel {
    String? firstName;
    String? lastName;
    String? userName;
    String? email;
    String? password;
    String? confirmPassword;

    ValidateModel({
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.password,
        this.confirmPassword,
    });

    factory ValidateModel.fromJson(Map<String, dynamic> json) => ValidateModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
    };
}
