import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      color: Colors.purple[200],
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Text('Icon'),
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
      body: Column(
        children: <Widget>[
          SnapListView(
            height: 180.0,
            width: 135.0,
            children: children,
          ),
          SnapListView(
            height: 180.0,
            width: 235.0,
            children: children,
          ),
        ],
      ),
    );
  }
}
