// main.dart

import 'package:flutter/material.dart';
import 'package:calorie_tracker/widgets/widgets.dart';

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
  List<String> _selectedItems = [];

  void _showMultiSelectNescafe() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Ice Tea',
      'Cappacuino',
      'Burger',
      'Sandwich',
      'Maggi',
      'Cofee'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  void _showMultiSelectHod() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Biryani',
      'Momos',
      'Panner roti',
      'Chicken curry',
      'Fried Rice',
      'Chicken Maggi'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  void _showMultiSelectTuckshop() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Patties',
      'Lassi',
      'Biscuits',
      'Chips',
      'Cool Drinks',
      'Ice creams'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHOOSE MEAL',
          style: TextStyle(letterSpacing: 1, fontSize: 25),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        toolbarHeight: 65,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25, 30, 20, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // use this button to open the multi-select dialog
                            ElevatedButton(
                              child: const Text('Nescafe',
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                    width: 1,
                                  )),
                              onPressed: _showMultiSelectNescafe,
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(35, 30, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 30, 30, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // use this button to open the multi-select dialog
                            ElevatedButton(
                              child: const Text('HOD',
                                  style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  minimumSize: const Size(80, 40),
                                  side: const BorderSide(
                                      width: 1, color: Colors.black)),
                              onPressed: _showMultiSelectHod,
                            ),
                          ]),
                    ),
                  ),
                ),
              ]),
              Row(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // use this button to open the multi-select dialog
                            ElevatedButton(
                              child: const Text('Tuck Shop',
                                  style: TextStyle(fontSize: 17)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                      width: 1, color: Colors.black)),
                              onPressed: _showMultiSelectTuckshop,
                            ),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(35, 20, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25, 30, 25, 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // use this button to open the multi-select dialog
                            ElevatedButton(
                              child: const Text('Outside',
                                  style: TextStyle(fontSize: 20)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent,
                                  minimumSize: const Size(100, 40),
                                  side: const BorderSide(
                                      width: 1, color: Colors.black)),
                              onPressed: () {},
                            ),
                          ]),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10),
                ),
              ),
              Wrap(
                children: _selectedItems
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 180, 0, 0),
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        minimumSize: const Size(100, 50),
                        side: const BorderSide(width: 1, color: Colors.black)),
                  )),
              TextButton(
                  onPressed: _reset,
                  child: Text('RESET', style: TextStyle(color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}

void _submit() {}
