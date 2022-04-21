import 'package:flutter/material.dart';
import 'package:calorie_tracker/widgets/widgets.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/models/models.dart';

// Multi Select widget
// This widget is reusable

// Implement a multi select on the Home screen

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  List<String> _selectedItems = [];

  void _showMultiSelect(foodItems) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = foodItems;

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems += results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
          onLongPress: () {},
          splashColor: Colors.orange,
          child: FloatingActionButton(
              onPressed: () {}, child: const Icon(Icons.check))),
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('CHOOSE MEAL', style: TextStyle(fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // use this button to open the multi-select dialog
            ElevatedButton(
              child: const Text('Mess', style: TextStyle(fontSize: 23)),
              onPressed: () => _showMultiSelect(['Dal Makhani']),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('HOD', style: TextStyle(fontSize: 23)),
              onPressed: () => _showMultiSelect(['Paratha']),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Tuck Shop', style: TextStyle(fontSize: 23)),
              onPressed: () => _showMultiSelect(['Ice Cream']),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Nescafe', style: TextStyle(fontSize: 23)),
              onPressed: () => _showMultiSelect(['Hot Dog']),
            ),
            const Divider(
              height: 100,
            ),
            // display selected items
            Wrap(
              spacing: 10,
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
