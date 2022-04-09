import 'package:flutter/material.dart';
import 'package:calorie_tracker/home_page/home_page.dart';
import 'package:calorie_tracker/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appTheme,
      ),
      home: const MyHomePage(title: homePageTitle),
    );
  }
}
