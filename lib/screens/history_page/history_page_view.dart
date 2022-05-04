import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: buildDataTable(),
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
