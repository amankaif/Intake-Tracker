import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/core/notifier/database.notifier.dart';
import 'package:calorie_tracker/models/models.dart';
import 'package:calorie_tracker/widgets/meal_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPage extends StatelessWidget {
  final CardItem item;
  const NewPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataBaseNotifier dataBaseNotifier =
        Provider.of<DataBaseNotifier>(context, listen: false);
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
              Container(
                height: 400,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FutureBuilder(
                  future: dataBaseNotifier.fetchFooditems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Row(
                          children: <Widget>[CircularProgressIndicator()],
                          mainAxisAlignment: MainAxisAlignment.center);
                    }
                    if (snapshot.hasData) {
                      var _snapshot = snapshot.data as List;
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _snapshot.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          FoodItems fooditems = _snapshot[index];
                          return CardDemoMeals(
                            name: fooditems.fName,
                          );
                        },
                      );
                    }
                    return Row(
                        children: <Widget>[CircularProgressIndicator()],
                        mainAxisAlignment: MainAxisAlignment.center);
                  },
                ),
              ),
              //   Expanded(
              //     child: Container(
              //       height: 350,
              //       padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),

              // child: ListView.separated(
              //   physics: const BouncingScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   itemCount: meals.length,
              //   separatorBuilder: (context, _) =>
              //       const SizedBox(height: 10),
              //   itemBuilder: (BuildContext context, int index) =>
              //       // CardDemoMeals(
              //     meal: meals[index],
              //     total: total,
              //   ),
              // ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
