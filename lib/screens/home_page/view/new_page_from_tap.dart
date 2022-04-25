import 'package:calorie_tracker/models/meals_data.dart';
import 'package:calorie_tracker/models/models.dart';
import 'package:calorie_tracker/widgets/demo_card.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final CardItem item;
  const NewPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List total = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(item.time),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // children: [CardDemoMeals(), CardDemoMeals(), CardDemoMeals()]
            // children: breakfast.map((meals) => mealsCard(meals)).toList(),
            children: [
              AspectRatio(
                aspectRatio: 5 / 3,
                child: Image.asset(
                  item.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ignore: unnecessary_new
              new Container(
                height: 350,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: meals.length,
                  separatorBuilder: (context, _) => const SizedBox(height: 10),
                  itemBuilder: (BuildContext context, int index) =>
                      CardDemoMeals(
                    meal: meals[index],
                    total: total,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
