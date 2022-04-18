import 'package:flutter/material.dart';

import 'package:calorie_tracker/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => const HomeScreen()},

      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
    );
  }
}
