// ignore_for_file: deprecated_member_use

import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/models/meals_data.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';

class CardDemoMeals extends StatefulWidget {
  CardDemoMeals({Key? key,required this.id, required this.name, required this.data})
      : super(key: key);
  var name;
  var id;
  HistoryData data;
  @override
  State<CardDemoMeals> createState() => _CardDemoMealsState();
}

class _CardDemoMealsState extends State<CardDemoMeals> {
  int _servings = 0;
  int _state = 0;

  // String name = widget.name;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.food_bank),
            // title: Text(widget.name),
            // subtitle: Text(
            //   'Dosa is very famous in Andhra Pradesh',
            //   style: TextStyle(color: Colors.amber),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.name),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Servings: "),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    // textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      if (_servings > 0 && _state == 0) {
                        setState(() => _servings--);
                      }
                    },
                    child: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$_servings',
                    style: const TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                      // textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        if (_state == 0) {
                          setState(() => _servings++);
                        }
                      },
                      child: const Icon(Icons.add_circle_outline)),
                  FlatButton(
                      // textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        if (_state == 0) {
                          _state = 1;
                          setState(() {
                            this.widget.data.id = widget.id;
                            this.widget.data.count = _servings;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text("Counter Locked :)"),
                            shape: StadiumBorder(),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                          ));
                        } else {
                          setState(() {
                            this.widget.data.id = widget.id;
                            this.widget.data.count = _servings;
                          });
                          _state = 0;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Counter Unlocked :)",
                            ),
                            duration: Duration(seconds: 2),
                            shape: StadiumBorder(),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                          ));
                        }
                        // setState(() => _servings++);
                      },
                      child: const Icon(Icons.save)),
                ],
              ),
            ],
          ),
          const Divider(),
          ListTile(
            // leading: Icon(Icons.food_bank),
            // title: Text(widget.name),
            subtitle: Text(
              'Preview:\n\nFood ID: ${widget.data.id}\nCount: ${widget.data.count}',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          // Image.asset('assets/images/bg.jpg'),
        ],
      ),
    );
  }
}
