// ignore_for_file: deprecated_member_use

import 'package:calorie_tracker/models/meals_data.dart';
import 'package:flutter/material.dart';

class CardDemoMeals extends StatefulWidget {
  final MealsItems meal;
  CardDemoMeals({Key? key, required this.meal}) : super(key: key);

  @override
  State<CardDemoMeals> createState() => _CardDemoMealsState();
}

class _CardDemoMealsState extends State<CardDemoMeals> {
  int _servings = 0;

  void _increment() {
    setState(() {
      _servings++;
    });
  }

  void _decrement() {
    setState(() {
      _servings--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Dosa'),
            subtitle: Text(
              'Dosa is very famous in Andhra Pradesh',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
          //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //   ),
          // ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Servings: "),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      _decrement;
                    },
                    child: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$_servings',
                    style: TextStyle(fontSize: 20),
                  ),
                  FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        _increment;
                      },
                      child: const Icon(Icons.add_circle_outline)),
                ],
              ),
            ],
          ),
          // Image.asset('assets/images/bg.jpg'),
        ],
      ),
    );
  }
}
