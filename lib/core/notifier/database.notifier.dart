// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/core/service/database.service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataBaseNotifier extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  Future fetchFooditems() async {
    List data = await _databaseService.fetchFooditems();
    return data.map((fooditem) => FoodItems.fromJson(fooditem)).toList();
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
