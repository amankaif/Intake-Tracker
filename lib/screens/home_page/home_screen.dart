import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/home_page/home_page.dart';

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
        title: const Text(
          "Monday 11 April, 2022",
          style: TextStyle(
            // fontFamily: 'Inter',
            fontSize: 17,
          ),
        ),
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
