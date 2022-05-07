import 'package:calorie_tracker/core/models_db/fooditems.odel.dart';
import 'package:calorie_tracker/core/notifier/database.notifier.dart';
import 'package:calorie_tracker/models/models.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/widgets/meal_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';

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
    HistoryData sendData = new HistoryData();
    return Scaffold(
      appBar: AppBar(
        title: Text(item.time),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // children: [CardDemoMeals(), CardDemoMeals(), CardDemoMeals()]
            // children: breakfast.map((meals) => mealsCard(meals)).toList(),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.65),
                  child: Column(children: [
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
                  ]),
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FutureBuilder(
                  future: dataBaseNotifier.fetchFooditems(
                    f_day: today.toLowerCase(),
                    f_time: item.title.toLowerCase(),
                  ),
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
                            id: fooditems.fid,
                            name: fooditems.fName,
                            data: sendData,
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
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    print(sendData.count);
                    print(sendData.id);
                    print("UserId: ${QueryResults.userId}");

                    print("Time:${formattedDate}");
                    dataBaseNotifier.addConsumption(
                        c_servings: sendData.count,
                        id: QueryResults.userId,
                        fid: sendData.id);

                    // history.add(sendData);
                    // dataHistory.add(sendData);
                  },
                  child: const Text('Submit'),
                ),
              )

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
