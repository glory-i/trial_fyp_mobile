// To parse this JSON data, do
//
//     final meal = mealFromJson(jsonString);

import 'dart:convert';

import 'package:trial_fyp_mobile/models/authentication/meal/meal.dart';

List<Meal> mealsFromJson(String str) => List<Meal>.from(json.decode(str).map((x) => Meal.fromJson(x)));

String mealsToJson(List<Meal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Meal {
//     int? id;
//     String? name;
//     String? description;
//     String? typeOfMeal;
//     String? producer;
//     double? cost;
//     double? calories;
//     double? protein;
//     double? carbs;
//     double? fat;
//     String? imageUrl;
//     String? flutterImageUrl;

//     Meal({
//         this.id,
//         this.name,
//         this.description,
//         this.typeOfMeal,
//         this.producer,
//         this.cost,
//         this.calories,
//         this.protein,
//         this.carbs,
//         this.fat,
//         this.imageUrl,
//         this.flutterImageUrl,
//     });

//     factory Meal.fromJson(Map<String, dynamic> json) => Meal(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         typeOfMeal: json["typeOfMeal"],
//         producer: json["producer"],
//         cost: json["cost"]?.toDouble(),
//         calories: json["calories"]?.toDouble(),
//         protein: json["protein"]?.toDouble(),
//         carbs: json["carbs"]?.toDouble(),
//         fat: json["fat"]?.toDouble(),
//         imageUrl: json["imageUrl"],
//         flutterImageUrl: json["flutterImageUrl"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "typeOfMeal": typeOfMeal,
//         "producer": producer,
//         "cost": cost,
//         "calories": calories,
//         "protein": protein,
//         "carbs": carbs,
//         "fat": fat,
//         "imageUrl": imageUrl,
//         "flutterImageUrl": flutterImageUrl,
//     };
//}
