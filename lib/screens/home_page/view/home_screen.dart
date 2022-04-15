import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/home_page/home_page.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    Widget buildCard({
      required CardItem item,
    }) {
      return Container(
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
                          image: NetworkImage(item.urlImage),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewPage(
                                    item: item,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                  )),
            ),
            const SizedBox(height: 4),
            Text(item.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(item.time,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: displayedDayDateString,
        centerTitle: true,
        elevation: 0.0,
        // backgroundColor: Colors.green,
      ),

      body: Container(
          height: 200,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            //For giving space between each box
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            //Iterates through each element from the items
            itemBuilder: (BuildContext context, int index) => buildCard(item: items[index]),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.restaurant),

        // backgroundColor: Colors.green,
      ),
    );

  }
}
