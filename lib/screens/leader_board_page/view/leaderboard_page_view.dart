import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';
import 'package:calorie_tracker/core/provider/provider.dart';
import 'package:calorie_tracker/core/notifier/notifier.dart';
import 'package:calorie_tracker/core/service/service.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  LeaderBoardState createState() => LeaderBoardState();
}

class LeaderBoardState extends State<LeaderBoard> {
  // final List items = [
  //   {
  //     'name': "Ashish",
  //     'calories': 2700,
  //   },
  //   {
  //     'name': "Satya",
  //     'calories': 2500,
  //   },
  //   {
  //     'name': "Harsh",
  //     'calories': 2300,
  //   },
  //   {
  //     'name': "Vishnu",
  //     'calories': 1950,
  //   },
  //   {
  //     'name': "Venkat",
  //     'calories': 1885,
  //   },
  //   {
  //     'name': "Om",
  //     'calories': 1850,
  //   },
  //   {
  //     'name': "Asif",
  //     'calories': 1790,
  //   },
  //   {
  //     'name': "Aman",
  //     'calories': 1720,
  //   },
  //   {
  //     'name': "Abhishek",
  //     'calories': 1670,
  //   },
  //   {
  //     'name': "Arjun",
  //     'calories': 1620,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    final DataBaseNotifier dataBaseNotifier =
        Provider.of<DataBaseNotifier>(context, listen: false);
    return FutureBuilder(
        future: dataBaseNotifier.fetchLeaderboardEntries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                  children: <Widget>[CircularProgressIndicator()],
                  mainAxisAlignment: MainAxisAlignment.center),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      // height: 330,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                                radius: 45,
                              ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            QueryResults.userName,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    QueryResults.leadboardUserCalorieCount
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(1.0)),
                                  ),
                                  const Text("calories",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("#"+QueryResults.leaderboardUserRank.toString(),
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300,
                                          color:
                                              Colors.white.withOpacity(1.0))),
                                  const Text("Rank",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Leaderboard",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(18)),
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 300,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(QueryResults.entryList[index]['name']
                                        ['name'])
                                  ],
                                ),
                                leading: Text(
                                  "#${index + 1}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                    QueryResults.entryList[index]
                                            ['total_calories']
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                                  thickness: 1.5,
                                  color: Colors.blue,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                            itemCount: QueryResults.entryList.length),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
                children: <Widget>[CircularProgressIndicator()],
                mainAxisAlignment: MainAxisAlignment.center),
          );
        });
  }
}
