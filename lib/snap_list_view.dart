import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SnapListView extends StatefulWidget {
  final width; // = 235.0;
  final height; // = 180.0;
  final dividerWidth; // = 15.0;
  final topBottomMargin; // = 20.0;
  final leftItemShowSize; // = 20.0;
  final time; // = 150;
  final firstLastSpace; // = 15.0;
  final children;
  final listBackColor;
  SnapListView({
    Key key,
    @required this.width,
    @required this.height,
    @required this.children,
    this.dividerWidth = 15.0,
    this.topBottomMargin = 20.0,
    this.leftItemShowSize = 20.0,
    this.time = 150,
    this.firstLastSpace = 15.0,
    this.listBackColor,
  }) : super(key: key);
  @override
  _SnapListViewState createState() => _SnapListViewState();
}

class _SnapListViewState extends State<SnapListView> {
  var width;
  var height;
  var dividerWidth;
  var topBottomMargin;
  var leftItemShowSize;
  var time;
  var dimension;
  var firstLastSpace;
  Color listBackColor;
  List<Widget> children;
  ScrollController scrollController = ScrollController();
  bool leftScrollFlag = false;
  bool rightScrollFlag = false;

  @override
  void initState() {
    width = widget.width;
    height = widget.height;
    dividerWidth = widget.dividerWidth;
    topBottomMargin = widget.topBottomMargin;
    leftItemShowSize = widget.leftItemShowSize;
    time = widget.time;
    firstLastSpace = widget.firstLastSpace;
    listBackColor = widget.listBackColor;
    children = widget.children;
    dimension = width + dividerWidth;
    super.initState();
  }

  listUpEvent(_) {
    setState(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !leftScrollFlag) {
        leftScrollFlag = true;
        scrollController
            .animateTo(
                scrollController.position.pixels ~/ dimension * dimension -
                    leftItemShowSize,
                duration: Duration(milliseconds: time),
                curve: Curves.linear)
            .then((v) {
          leftScrollFlag = false;
        });
      }

      if (scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          !rightScrollFlag) {
        rightScrollFlag = true;
        scrollController
            .animateTo(
                (scrollController.position.pixels +
                            dimension +
                            leftItemShowSize) ~/
                        dimension *
                        dimension -
                    leftItemShowSize,
                duration: Duration(milliseconds: time),
                curve: Curves.linear)
            .then((v) {
          rightScrollFlag = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: listBackColor,
      child: Listener(
        onPointerUp: listUpEvent,
        child: NotificationListener(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: firstLastSpace),
                child: Row(
                  children: children
                      .map(
                        (child) => Container(
                          padding: EdgeInsets.fromLTRB(0, topBottomMargin,
                              dividerWidth, topBottomMargin),
                          child: Container(
                            height: height,
                            width: width,
                            child: child,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
