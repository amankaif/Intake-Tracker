import 'package:flutter/material.dart';
import 'package:calorie_tracker/widgets/widgets.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/models/models.dart';

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
        elevation: 0.0,
        // backgroundColor: Colors.green,
      ),
      body: Container(
          height: 200,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            //For giving space between each box
            separatorBuilder: (context, _) => const SizedBox(width: 12),
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
