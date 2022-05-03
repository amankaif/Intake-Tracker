import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Authentication

final supabase = Supabase.instance.client;

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


final timeNow = DateTime.now();
final timeParse = DateTime.parse('1969-07-20 20:18:04Z');
// var day = DateFormat.yMMMMd('en_US');
var leaderProfileBackgroundColor = Colors.purple;
var leaderProfileTextColor = Colors.white;

// get the today's day
var today = 'tuesday';