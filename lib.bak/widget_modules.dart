import 'package:flutter/material.dart';
import 'screen_blocks.dart';
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
      child: Padding(
        padding: EdgeInsets.all(globals.blockSizeHorizontal * 4.5),
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
        labelStyle: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * 3.8,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
            letterSpacing: SizeConfig.blockSizeHorizontal * 0.25),
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
        CardHome(), // Icon(Icons.note),
        Icon(Icons.notification_important),
        Icon(Icons.done_all),
        Icon(Icons.archive)
      ],
    );
  }
}

class CardHome extends StatefulWidget {
  String cardHead;
  String cardDesc;
  String cardTime;
  String cardDate;

  CardHome(
      {this.cardHead, this.cardDesc, this.cardTime, this.cardDate});

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(globals.blockSizeHorizontal * 6,
          globals.blockSizeVertical * 3, globals.blockSizeHorizontal * 6, 0),
      width: globals.blockSizeHorizontal * 87,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4.5)),
        color: Color(globals.secColor),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: globals.blockSizeVertical * 2.7,
              horizontal: globals.blockSizeHorizontal * 6.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: globals.blockSizeHorizontal * 56,
                    child: Text(
                      'Buy Plane Tickets',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          height: globals.blockSizeVertical * 0.14,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          fontSize: globals.blockSizeHorizontal * 3.5,
                          letterSpacing: globals.blockSizeHorizontal * 0.1,
                          color: Color(0xff171b20)),
                    ),
                  ),
                  Text(
                    '8:20',
                    style: TextStyle(
                        fontFamily: 'Arboria',
                        fontWeight: FontWeight.w400,
                        fontSize: globals.blockSizeHorizontal * 3.8,
                        color: globals.inactHeadTextColor),
                  ),
                ],
              ),
              SizedBox(
                height: globals.blockSizeVertical * 2,
              ),
              Container(
                width: globals.blockSizeHorizontal * 70,
                child: Text(
                  'Buy Tickets hdcuiadcniqawdn qwhduiqawdnqwidnqwudjqd qndquidqaa dnu',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: globals.blockSizeHorizontal * 3.5,
                      letterSpacing: globals.blockSizeHorizontal * 0.02,
                      color: Color(0xff171b20)),
                ),
              ),
              SizedBox(height: globals.blockSizeVertical * 2),
              Text(
                '23 January',
                style: TextStyle(
                    fontFamily: 'Arboria',
                    fontWeight: FontWeight.w400,
                    fontSize: globals.blockSizeHorizontal * 3.3,
                    color: globals.inactHeadTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
