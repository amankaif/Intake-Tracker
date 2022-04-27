import 'package:calorie_tracker/screens/home_page/view/navbar.dart';
import 'package:calorie_tracker/widgets/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/widgets/widgets.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/models/models.dart';
import 'package:calorie_tracker/models/screens_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavBar(),

      // ignore: prefer_const_literals_to_create_immutables

      body: Container(
          // height: 200,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView.separated(
            // scrollDirection: Axis.horizontal,
            itemCount: items.length,
            //For giving space between each box
            separatorBuilder: (context, _) => const SizedBox(height: 12),
            //Iterates through each element from the items
            itemBuilder: (BuildContext context, int index) =>
                CardWidget(item: items[index]),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'meals');
        },
        child: const Icon(Icons.restaurant),

        // backgroundColor: Colors.green,
      ),
    );
  }
}
