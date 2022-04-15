import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/home_page/home_page.dart';
import 'package:calorie_tracker/ui_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: displayedDayDateString,

        centerTitle: true,
        // backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Meals'),

        // backgroundColor: Colors.green,
      ),
    );
  }
}
