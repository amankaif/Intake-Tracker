import 'dart:convert';

class HistoryData {
  late int id = 0;
  late int count = 0;
  // final String time;
}

// To parse this JSON data, do
//
//     final foodItems = foodItemsFromJson(jsonString);

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
  });

  int cid;
  int fid;
  String cTime;
  int cServings;
  String id;

  factory ConsumedData.fromJson(Map<String, dynamic> json) => ConsumedData(
        cid: json["cid"],
        fid: json["fid"],
        cTime: json["c_time"].toString(),
        cServings: json["c_servings"],
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "fid": fid,
        "c_time": cTime,
        "c_servings": cServings,
        "id": id,
      };
}
