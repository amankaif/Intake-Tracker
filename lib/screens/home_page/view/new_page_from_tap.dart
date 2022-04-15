import 'package:calorie_tracker/models/models.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final CardItem item;
  const NewPage({Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.time),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(item.urlImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight:FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

