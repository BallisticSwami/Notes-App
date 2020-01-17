import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'main.dart';
import 'globals.dart' as globals;
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

double mainTab = 150;
var primColor = 0xff3F79FE;
var secColor = 0xffF5F7FB;
var actTextColor = Colors.white;
var inactNumTextColor = Color(0xff171b21);
var inactHeadTextColor = Color(0xffC8C9D5);

// Widget for text on Main Tiles

class TileData extends StatefulWidget {
  List<Widget> tileDataWidgets;
  TileData({this.tileDataWidgets});
  @override
  _TileDataState createState() => _TileDataState();
}

class _TileDataState extends State<TileData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200 - 15.0,
      width: mainTab - 10.0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.tileDataWidgets,
        ),
      ),
    );
  }
}

// Widget for simplyfing TabBar Code


class MyTabBar extends StatefulWidget {
  final TabController controller;

  const MyTabBar(this.controller, {Key key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
          child: TabBar(

        controller: widget.controller,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Gilroy', letterSpacing: 0.8),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: inactNumTextColor,
        unselectedLabelColor: inactHeadTextColor,
        isScrollable: true,
        indicator: MD2Indicator(
            indicatorColor: Color(primColor),
            indicatorHeight: 3,
            indicatorSize: MD2IndicatorSize.normal),
        tabs: <Widget>[
          Tab(
            text: 'Notes',
          ),
          Tab(
            text: 'Important',
          ),
          Tab(
            text: 'Performed',
          ),
          Tab(
            text: 'Archived',
          )
        ],
      ),
    );
  }
}


class MyTabBarView extends StatefulWidget {
  final TabController controller;

  const MyTabBarView(this.controller, {Key key}) : super(key: key);

  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.controller,
            children: <Widget>[
              Icon(Icons.note),
              Icon(Icons.notification_important),
              Icon(Icons.done_all),
              Icon(Icons.archive)
            ],
    );
}
}