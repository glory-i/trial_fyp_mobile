// To parse this JSON data, do
//
//     final meal = mealFromJson(jsonString);

import 'dart:convert';

Meal mealFromJson(String str) => Meal.fromJson(json.decode(str));

String mealToJson(Meal data) => json.encode(data.toJson());

class Meal {
    int? id;
    String? name;
    String? description;
    String? typeOfMeal;
    String? producer;
    double? cost;
    double? calories;
    double? protein;
    double? carbs;
    double? fat;
    String? imageUrl;
    String? flutterImageUrl;
    dynamic foodImageData;
    dynamic imageFile;

    Meal({
        this.id,
        this.name,
        this.description,
        this.typeOfMeal,
        this.producer,
        this.cost,
        this.calories,
        this.protein,
        this.carbs,
        this.fat,
        this.imageUrl,
        this.flutterImageUrl,
        this.foodImageData,
        this.imageFile,
    });

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        typeOfMeal: json["typeOfMeal"],
        producer: json["producer"],
        cost: json["cost"]?.toDouble(),
        calories: json["calories"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
        carbs: json["carbs"]?.toDouble(),
        fat: json["fat"]?.toDouble(),
        imageUrl: json["imageUrl"],
        flutterImageUrl: json["flutterImageUrl"],
        foodImageData: json["foodImageData"],
        imageFile: json["imageFile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "typeOfMeal": typeOfMeal,
        "producer": producer,
        "cost": cost,
        "calories": calories,
        "protein": protein,
        "carbs": carbs,
        "fat": fat,
        "imageUrl": imageUrl,
        "flutterImageUrl": flutterImageUrl,
        "foodImageData": foodImageData,
        "imageFile": imageFile,
    };
}
