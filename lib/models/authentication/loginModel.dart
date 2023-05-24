// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? usernameOrEmail;
    String? password;

    LoginModel({
        this.usernameOrEmail,
        this.password,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        usernameOrEmail: json["usernameOrEmail"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "usernameOrEmail": usernameOrEmail,
        "password": password,
    };
}
