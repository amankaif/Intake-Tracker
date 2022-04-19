// main.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEALS PAGE',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

// Multi Select widget
// This widget is reusable
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

// Implement a multi select on the Home screen
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Idli/Sambhar',
      'Veg Biryani',
      'Samosa',
      'Chapati',
      'Mix Dal',
      'Salad'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('CHOOSE MEAL', style: TextStyle(fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // use this button to open the multi-select dialog
            ElevatedButton(
              child: const Text('Mess', style: TextStyle(fontSize: 23)),
              onPressed: _showMultiSelect,
            ),
            const Divider(
              height: 10,
            ),
            // display selected items
            // Wrap(
            //   children: _selectedItems
            //       .map((e) => Chip(
            //     label: Text(e),
            //   ))
            //       .toList(),
            // ),
            const SizedBox(height: 30),
            ElevatedButton(
                child: const Text('HOD', style: TextStyle(fontSize: 23)),
                onPressed: _showMultiSelect),
            // const Divider(
            //   height: 10,
            // ),
            // // display selected items
            // Wrap(
            //   children: _selectedItems
            //       .map((e) => Chip(
            //     label: Text(e),
            //   ))
            //       .toList(),
            // ),
            const SizedBox(height: 30),
            ElevatedButton(
                child: const Text('Tuck Shop', style: TextStyle(fontSize: 23)),
                onPressed: _showMultiSelect),
            // const Divider(
            //   height: 10,
            // ),
            // // display selected items
            // Wrap(
            //   children: _selectedItems
            //       .map((e) => Chip(
            //     label: Text(e),
            //   ))
            //       .toList(),
            // ),
            const SizedBox(height: 30),
            ElevatedButton(
                child: const Text('Nescafe', style: TextStyle(fontSize: 23)),
                onPressed: _showMultiSelect),
            const Divider(
              height: 100,
            ),
            // display selected items
            Wrap(
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
