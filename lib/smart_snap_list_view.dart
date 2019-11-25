import 'package:flutter/material.dart';
import 'package:item_page/snap_list_view.dart';

class SmartSnapListView extends StatefulWidget {
  final height;
  final count;
  final dividerWidth;
  final children;
  final factor;

  SmartSnapListView({
    Key key,
    @required this.children,
    @required this.height,
    this.count = 1,
    this.dividerWidth = 10.0,
    this.factor = 0.9,
  }) : super(key: key);
  @override
  _SmartSnapListViewState createState() => _SmartSnapListViewState();
}

class _SmartSnapListViewState extends State<SmartSnapListView> {
  double height;
  int count;
  double dividerWidth;
  double factor;
  List<Widget> children;
  @override
  void initState() {
    height = widget.height;
    count = widget.count ?? 1;
    dividerWidth = widget.dividerWidth ?? 10.0;
    children = widget.children;
    factor = widget.factor ?? 0.9;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SnapListView(
      height: height,
      width: MediaQuery.of(context).size.width * factor / count - dividerWidth,
      children: children,
      leftItemShowSize:
          MediaQuery.of(context).size.width * (1 - factor) / 2.0 - dividerWidth,
      dividerWidth: dividerWidth,
    );
  }
}
