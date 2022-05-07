// ignore_for_file: sized_box_for_whitespace

import 'package:calorie_tracker/core/persistent_data/data_holders.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  HistoryCard({Key? key, required this.data}) : super(key: key);
  ConsumedData data;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   print(this.widget.data.fid);
    //   print(QueryResults.foodName);
    //   QueryResults.getFoodName(food_id: this.widget.data.fid);
    // });
    return Card(
      // clipBehavior: Clip.antiAlias,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              // width: 380,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.history),
                  ),
                  Container(width: 300, child: Text(this.widget.data.f_name))
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Servings: ${this.widget.data.cServings}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Consumption_Time: ${this.widget.data.cTime}"),
            ),

            // Image.asset('assets/images/bg.jpg'),
          ],
        ),
      ),
    );
  }
}
