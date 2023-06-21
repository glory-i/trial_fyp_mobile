// To parse this JSON data, do
//
//     final mealPlan = mealPlanFromJson(jsonString);

import 'dart:convert';

import 'meal.dart';

MealPlan mealPlanFromJson(String str) => MealPlan.fromJson(json.decode(str));

String mealPlanToJson(MealPlan data) => json.encode(data.toJson());

class MealPlan {
    List<Meal>? meals;
    double? fitness;
    double? totalCalories;
    double? totalCarbs;
    double? totalProtein;
    double? totalFat;
    double? totalCost;
    double? percentCalorieFromFat;
    double? percentCalorieFromCarbs;
    double? percentCalorieFromProtein;

    MealPlan({
        this.meals,
        this.fitness,
        this.totalCalories,
        this.totalCarbs,
        this.totalProtein,
        this.totalFat,
        this.totalCost,
        this.percentCalorieFromFat,
        this.percentCalorieFromCarbs,
        this.percentCalorieFromProtein,
    });

    factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
        fitness: json["fitness"]?.toDouble(),
        totalCalories: json["totalCalories"]?.toDouble(),
        totalCarbs: json["totalCarbs"]?.toDouble(),
        totalProtein: json["totalProtein"]?.toDouble(),
        totalFat: json["totalFat"]?.toDouble(),
        totalCost: json["totalCost"]?.toDouble(),
        percentCalorieFromFat: json["percentCalorieFromFat"]?.toDouble(),
        percentCalorieFromCarbs: json["percentCalorieFromCarbs"]?.toDouble(),
        percentCalorieFromProtein: json["percentCalorieFromProtein"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "meals": meals == null ? [] : List<dynamic>.from(meals!.map((x) => x.toJson())),
        "fitness": fitness,
        "totalCalories": totalCalories,
        "totalCarbs": totalCarbs,
        "totalProtein": totalProtein,
        "totalFat": totalFat,
        "totalCost": totalCost,
        "percentCalorieFromFat": percentCalorieFromFat,
        "percentCalorieFromCarbs": percentCalorieFromCarbs,
        "percentCalorieFromProtein": percentCalorieFromProtein,
    };
}

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
// }
