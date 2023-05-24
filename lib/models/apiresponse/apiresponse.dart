// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    String? message;
    String? code;
    dynamic data;
    ApiError? error;

    ApiResponse({
        this.message,
        this.code,
        required this.data,
        this.error,
    });

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        code: json["code"],
        data: json["data"],
        error: json["error"] == null ? null : ApiError.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data,
        "error": error?.toJson(),
    };
}

class ApiError {
    String? message;

    ApiError({
        this.message,
    });

    factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
