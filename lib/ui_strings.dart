import 'package:calorie_tracker/supabase/supabase.credentials.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Authentication

final supabase = Supabase.instance.client;

// late String userId = '';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

var displayedDayDateString = const Text("Monday 17 April, 2022",
    style: TextStyle(
      // fontFamily: 'Inter',
      fontSize: 17,
    ));

var leaderProfileBackgroundColor = Colors.purple;
var leaderProfileTextColor = Colors.white;
// get the today's day
var time = DateTime.now();
String val = time as String;
String formattedDate = DateFormat('dd-MM-yyyy kk:mm:ss').format(time);
// TimeOfDay now = TimeOfDay.now();
var today = DateFormat('EEEE').format(time);
