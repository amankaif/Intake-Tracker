import 'package:flutter/material.dart';
import 'navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
        appBar: AppBar(
          title: Text("Monday 11 April, 2022",
            style: TextStyle(
              // fontFamily: 'Inter',
              fontSize: 17,
            ),

          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child:
        Text('Meals'),

        // backgroundColor: Colors.green,
      ),
    );
  }
}
