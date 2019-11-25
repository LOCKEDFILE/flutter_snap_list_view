import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:item_page/smart_snap_list_view.dart';
import 'package:item_page/snap_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ItemList(),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Widget> children = [
    Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.ac_unit),
          // Text('Icon'),
        ],
      ),
    ),
    for (var i = 0; i < 30; i++) ...[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: i % 2 == 0 ? Colors.blue[200] : Colors.green[200],
        ),
        child: Center(child: Text('$i')),
      ),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snap List View!')),
      body: ListView(
        children: <Widget>[
          SnapListView(
            height: 180.0,
            width: MediaQuery.of(context).size.width * 0.9 - 10.0,
            children: children,
            leftItemShowSize: MediaQuery.of(context).size.width * 0.05 - 10,
            dividerWidth: 10.0,
          ),
          SnapListView(
            height: 180.0,
            width: 140.0,
            children: children,
          ),
          SmartSnapListView(
            height: 120.0,
            count: 1,
            factor: 0.7,
            children: children,
          ),
          SmartSnapListView(
            children: children,
            height: 120.0,
            count: 3,
            factor: 0.8,
          ),
        ],
      ),
    );
  }
}
