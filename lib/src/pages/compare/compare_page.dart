import 'package:flutter/material.dart';



class ComparePage extends StatefulWidget {
  final String title;

  const ComparePage({
    @required this.title,
  });


  @override
  _ComparePageState createState() => _ComparePageState();
}

class NewObject {
  final String title;
  final IconData icon;


  NewObject(this.title, this.icon);
}
// static final List<NewObject> items = <NewObject>[
//   NewObject("Apple", Icons.access_alarms),
//   NewObject('Banana', Icons.mail),
//   NewObject('Orange', Icons.account_balance_wallet),
//   NewObject('Other Fruit', Icons.account_box),
// ];
class _ComparePageState extends State<ComparePage> {
  static final List<NewObject> items = <NewObject>[
    NewObject("หอพัก", Icons.access_alarms),
    NewObject('คอนโด', Icons.mail),
    NewObject('อพาร์เมนต์', Icons.account_balance_wallet),
    NewObject('Other ', Icons.account_box),
  ];
  NewObject value = items.first;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.cyan,
      title: Text('เปรียบเทียบราคาห้องเช่า'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildDropdown(),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildDropdown() => Container(
    width: 300,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.deepOrange, width: 4),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<NewObject>(
        value: value, // currently selected item
        items: items
            .map((item) => DropdownMenuItem<NewObject>(
          child: Row(
            children: [
              Icon(item.icon),
              const SizedBox(width: 8),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          value: item,
        ))
            .toList(),
        onChanged: (value) => setState(() {
          this.value = value;
        }),
      ),
    ),
  );
}