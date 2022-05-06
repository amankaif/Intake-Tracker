// main.dart

import 'package:flutter/material.dart';
import 'package:calorie_tracker/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/core/notifier/notifier.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';

// Multi Select widget
// This widget is reusable

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState();

  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _MealsPageState extends State<MealsPage> {
  var _selectedItems = [];

  void _showMultiSelectNescafe(_nescafeItems) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    // final List<String> _nescafeItems = [
    //   'Ice Tea',
    //   'Cappacuino',
    //   'Burger',
    //   'Sandwich',
    //   'Maggi',
    //   'Cofee'
    // ];

    final dynamic results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _nescafeItems);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems += results;
      });
    }
  }

  void _showMultiSelectHod(_hodItems) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    // final List<String> _hodItems = [
    //   'Biryani',
    //   'Momos',
    //   'Panner roti',
    //   'Chicken curry',
    //   'Fried Rice',
    //   'Chicken Maggi'
    // ];

    final dynamic results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _hodItems);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems += results;
      });
    }
  }

  void _showMultiSelectTuckshop(_tuckShopItems) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    // final List<String> _tuckShopItems = [
    //   'Patties',
    //   'Lassi',
    //   'Biscuits',
    //   'Chips',
    //   'Cool Drinks',
    //   'Ice creams'
    // ];

    final dynamic results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _tuckShopItems);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems += results;
      });
    }
  }

  void _reset() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => MealsPage(),
      ),
    );
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    final DataBaseNotifier dataBaseNotifier =
        Provider.of<DataBaseNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHOOSE MEAL',
          style: TextStyle(letterSpacing: 1, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        toolbarHeight: 65,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: dataBaseNotifier.fetchMealsPageItems(),
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
                // var outletList = snapshot.data as List;
                var outletList = QueryResults.outletList;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 30, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25, 30, 20, 30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // use this button to open the multi-select dialog
                                        ElevatedButton(
                                          child: const Text('Nescafe',
                                              style: TextStyle(fontSize: 20)),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context)
                                                .backgroundColor,
                                            minimumSize: const Size(100, 40),
                                          ),
                                          onPressed: () =>
                                              _showMultiSelectNescafe(
                                                  outletList[0]),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  35, 30, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40, 30, 30, 30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // use this button to open the multi-select dialog
                                        ElevatedButton(
                                          child: const Text('HOD',
                                              style: TextStyle(fontSize: 18)),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context)
                                                .backgroundColor,
                                            minimumSize: const Size(80, 40),
                                          ),
                                          onPressed: () => _showMultiSelectHod(
                                              outletList[1]),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 20, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 30, 20, 30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // use this button to open the multi-select dialog
                                        ElevatedButton(
                                          child: const Text('Tuck Shop',
                                              style: TextStyle(fontSize: 17)),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context)
                                                .backgroundColor,
                                            minimumSize: const Size(100, 40),
                                          ),
                                          onPressed: () =>
                                              _showMultiSelectTuckshop(
                                                  outletList[2]),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  35, 20, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25, 30, 25, 30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // use this button to open the multi-select dialog
                                        ElevatedButton(
                                          child: const Text('Outside',
                                              style: TextStyle(fontSize: 20)),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context)
                                                .backgroundColor,
                                            minimumSize: const Size(100, 40),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ]),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                            thickness: 1,
                            color: Colors.black,
                            indent: 10,
                            endIndent: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: _selectedItems
                              .map((item) => Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Chip(
                                      padding: EdgeInsets.all(2),
                                      label: Text(item["f_name"]),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 15, 0, 0),
                              child: ElevatedButton(
                                onPressed: _submit,
                                child: const Text(
                                  'SUBMIT',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).backgroundColor,
                                  minimumSize: const Size(100, 50),
                                ),
                              )),
                          TextButton(
                              onPressed: _reset,
                              child: const Text('RESET',
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                    children: <Widget>[CircularProgressIndicator()],
                    mainAxisAlignment: MainAxisAlignment.center),
              );
            }),
      ),
    );
  }
}

void _submit() {}
