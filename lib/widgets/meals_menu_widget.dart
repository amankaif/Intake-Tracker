import 'package:flutter/material.dart';

Widget mealsCard(meals) {
  return Card(
    margin: const EdgeInsets.fromLTRB(18, 18, 18, 0),
    child: Column(children: [Text(meals), Text(meals)]),
  );
}
