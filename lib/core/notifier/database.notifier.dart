// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/core/service/database.service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:calorie_tracker/core/db_data/db_data.dart';

class DataBaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  late String _day;
  late String _time;

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

  Future<PostgrestResponse?> addDemoitems({
    required String name,
  }) async {
    await _databaseService.addDemoitems(name: 'Asif');
  }
}
