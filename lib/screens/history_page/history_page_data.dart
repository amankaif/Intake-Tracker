import 'dart:convert';

import 'package:flutter/material.dart';

class HistoryData {
  late int id = 0;
  late int count = 0;
  // final String time;

}

class ConData {
  late int cid = 0;
  late int fid = 0;
  late String cTime = '';
  late int cServings = 0;
  late String id = '';
}

List<ConsumedData> foodItemsFromJson(String str) => List<ConsumedData>.from(
    json.decode(str).map((x) => ConsumedData.fromJson(x)));

String foodItemsToJson(List<ConsumedData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConsumedData {
  ConsumedData({
    required this.cid,
    required this.fid,
    required this.cTime,
    required this.cServings,
    required this.id,
    required this.f_name,
  });

  int cid = 0;
  int fid = 0;
  String cTime = '';
  int cServings = 0;
  String id = '';
  String f_name = "";

  factory ConsumedData.fromJson(Map<String, dynamic> json) => ConsumedData(
        cid: json["cid"],
        fid: json["fid"],
        cTime: json["c_time"],
        cServings: json["c_servings"],
        id: json["id"],
        f_name: json["f_name"]["f_name"]
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "fid": fid,
        "c_time": cTime,
        "c_servings": cServings,
        "id": id,
        "f_name": f_name
      };
}
// class SubmitData{
//   final String 

// }
// List<HistoryData> history = [
  
// ];
