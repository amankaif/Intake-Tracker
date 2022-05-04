import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/core/service/database.service.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';

class DataBaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  late String _day;
  late String _time;
  late int _serving;
  late String _id;
  late int _fid;

  Future fetchFooditems({required String f_day, required String f_time}) async {
    _day = f_day;
    _time = f_time;
    // print(_day);
    var data =
        await _databaseService.fetchFooditems(f_day: _day, f_time: _time);
    // print(data);
    return data.map((fooditem) => FoodItems.fromJson(fooditem)).toList();
    //
  }

  Future fetchConsumedData() async {
    var data = await _databaseService.fetchConsumedData();
    // print(data);
    return data.map((dataConsumed) => ConsumedData.fromJson(dataConsumed))
        .toList();
  }

  Future fetchLeaderboardEntries() async {
    dynamic entryList = await _databaseService.fetchLeaderboardEntries();
    // return outletList;

    QueryResults.entryList = entryList;
    QueryResults.haveLeaderboardEntriesPulled = true;

    // return data.map((fooditem) => FoodItems.fromJson(fooditem)).toList();
    // print(data);
    // FoodItems modelledData = FoodItems.fromJson((data));
    // return modelledData;
  }

  Future fetchMealsPageItems() async {
    List outletList = await _databaseService.fetchMealsPageItems();
    // return outletList;
    if (QueryResults.haveMealItemsPulled) {
    } else {
      QueryResults.outletList = outletList;
    }
    // return data.map((fooditem) => FoodItems.fromJson(fooditem)).toList();
    // print(data);
    // FoodItems modelledData = FoodItems.fromJson((data));
    // return modelledData;
  }

  

  Future<PostgrestResponse?> addConsumption(
      {required int fid, required String id, required int c_servings}) async {
    _serving = c_servings;
    _id = id;
    _fid = fid;
    await _databaseService.addConsumption(
        fid: _fid, id: _id, c_servings: _serving);
  }
}
