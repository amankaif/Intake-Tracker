import 'package:calorie_tracker/models/card_data.dart';
import 'package:calorie_tracker/models/meals_data.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/home_page/view/new_page_from_tap.dart';

class CardWidget extends StatefulWidget {
  final CardItem item;
  // ignore: use_key_in_widget_constructors
  CardWidget({required this.item});
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(widget.item.urlImage),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPage(
                                  item: widget.item,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))),
          ),
          const SizedBox(height: 4),
          Text(widget.item.title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(widget.item.time,
              style:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
