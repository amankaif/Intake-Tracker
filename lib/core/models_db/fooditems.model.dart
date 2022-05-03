// To parse this JSON data, do
//
//     final foodItems = foodItemsFromJson(jsonString);

import 'dart:convert';

List<FoodItems> foodItemsFromJson(String str) =>
    List<FoodItems>.from(json.decode(str).map((x) => FoodItems.fromJson(x)));

String foodItemsToJson(List<FoodItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodItems {
  FoodItems({
    required this.fid,
    required this.fName,
    required this.fCalories,
    required this.fFats,
    required this.fProtein,
    required this.fDay,
    required this.fMealTime,
  });

  int fid;
  String fName;
  double fCalories;
  double fFats;
  double fProtein;
  String fDay;
  String fMealTime;

  factory FoodItems.fromJson(Map<String, dynamic> json) => FoodItems(
        fid: json["fid"],
        fName: json["f_name"],
        fCalories: json["f_calories"].toDouble(),
        fFats: json["f_fats"].toDouble(),
        fProtein: json["f_protein"].toDouble(),
        fDay: json["f_day"],
        fMealTime: json["f_meal_time"],
      );

  Map<String, dynamic> toJson() => {
        "fid": fid,
        "f_name": fName,
        "f_calories": fCalories,
        "f_fats": fFats,
        "f_protein": fProtein,
        "f_day": fDay,
        "f_meal_time": fMealTime,
      };
}
