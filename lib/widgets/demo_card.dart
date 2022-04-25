// ignore_for_file: deprecated_member_use

import 'package:calorie_tracker/models/meals_data.dart';
import 'package:flutter/material.dart';

class CardDemoMeals extends StatefulWidget {
  final MealsItems meal;
  List total;
  CardDemoMeals({Key? key, required this.meal, required this.total})
      : super(key: key);

  @override
  State<CardDemoMeals> createState() => _CardDemoMealsState();
}

class _CardDemoMealsState extends State<CardDemoMeals> {
  int _servings = 0;

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
                      if (_servings > 0) {
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
                        setState(() => _servings++);
                      },
                      child: const Icon(Icons.add_circle_outline)),
                  FlatButton(
                      // textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        setState(() => _servings++);
                      },
                      child: const Icon(Icons.save)),
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
