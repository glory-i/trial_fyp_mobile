// To parse this JSON data, do
//
//     final budgetRange = budgetRangeFromJson(jsonString);

import 'dart:convert';

List<BudgetRange> budgetRangeFromJson(String str) => List<BudgetRange>.from(json.decode(str).map((x) => BudgetRange.fromJson(x)));

String budgetRangeToJson(List<BudgetRange> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BudgetRange {
    int? minBudget;
    int? maxBudget;

    BudgetRange({
        this.minBudget,
        this.maxBudget,
    });

    factory BudgetRange.fromJson(Map<String, dynamic> json) => BudgetRange(
        minBudget: json["minBudget"],
        maxBudget: json["maxBudget"],
    );

    Map<String, dynamic> toJson() => {
        "minBudget": minBudget,
        "maxBudget": maxBudget,
    };
}
