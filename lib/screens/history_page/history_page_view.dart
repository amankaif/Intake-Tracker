import 'package:calorie_tracker/screens/history_page/history_page_data.dart';
import 'package:calorie_tracker/widgets/meal_list_card.dart';
import 'package:flutter/material.dart';
import '../../core/models_db/fooditems.model.dart';
import 'package:calorie_tracker/core/notifier/database.notifier.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final DataBaseNotifier dataBaseNotifier =
        Provider.of<DataBaseNotifier>(context, listen: false);
    ConData conData = new ConData();
    return Scaffold(
      appBar: AppBar(
        title: Text("HistoryPage"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // const SizedBox(height: 8),
          // Text(
          //   "hELLO",
          //   style: const TextStyle(
          //     fontSize: 15,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Container(
            // height: 300,
            width: 400,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: FutureBuilder(
              future: dataBaseNotifier.fetchConsumedData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("Waiting");
                  return Row(
                      children: <Widget>[CircularProgressIndicator()],
                      mainAxisAlignment: MainAxisAlignment.center);
                }
                if (snapshot.hasData) {
                  var _snapshot = snapshot.data as List;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _snapshot.length,
                    // separatorBuilder: (context, _) =>
                    //     const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      ConsumedData consumedData = _snapshot[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            const ListTile(
                              leading: Icon(Icons.history),
                              // title: Text("${}"),
                              // subtitle: Text(
                              //   'Dosa is very famous in Andhra Pradesh',
                              //   style: TextStyle(color: Colors.amber),
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Random Text"),
                            ),
                            const Divider(),

                            // Image.asset('assets/images/bg.jpg'),
                          ],
                        ),
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
        ],
      ),
    );
  }

  // Widget buildDataTable() {
  //   final columns = ['Cid', 'FId', 'count'];
  //   return DataTable(columns: getColumns(columns)
  //   // , rows: getRows(users)
  //   );
  // }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }
}
