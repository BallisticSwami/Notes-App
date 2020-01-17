import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;
import 'widget_modules.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: Colors.transparent, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage(), debugShowCheckedModeBanner: false);
  }
}

// For disabling scroll effect
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController = new ScrollController();

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      globals.tabIndex = _tabController.index;
      setState(() {
        if (_tabController.index == 0) {
          globals.tile1Switch = true;
          globals.tile2Switch = false;
          globals.tile3Switch = false;
          globals.tile4Switch = false;
          _scrollController.animateTo(0.0,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }

        if (_tabController.index == 1) {
          globals.tile2Switch = true;
          globals.tile1Switch = false;
          globals.tile3Switch = false;
          globals.tile4Switch = false;
          _scrollController.animateTo(0.0,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }

        if (_tabController.index == 2) {
          globals.tile3Switch = true;
          globals.tile2Switch = false;
          globals.tile1Switch = false;
          globals.tile4Switch = false;
          _scrollController.animateTo(300.0,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }

        if (_tabController.index == 3) {
          globals.tile4Switch = true;
          globals.tile2Switch = false;
          globals.tile3Switch = false;
          globals.tile1Switch = false;
          _scrollController.animateTo(300.0,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }
      });
    });
  }

  // Vars for 1st page appearance
  var avatarLocation = 'assets/images/avatar.jpg';
  var userName = 'Amoong Banjo';
  var primColor = 0xff3F79FE;
  var secColor = 0xffF5F7FB;
  var actTextColor = Colors.white;
  var inactNumTextColor = Color(0xff171b20);
  var inactHeadTextColor = Color(0xffC8C9D5);

  double mainTab = 150;

  // Vars for notes data
  int notesCount = 24;
  int importantCount = 6;
  int performedCount = 1337;
  int archivedCount = 20;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

// User details row

                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: new BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey[900].withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: Offset(2, 4),
                        )
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          avatarLocation,
                          height: 55,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(userName,
                        style: TextStyle(
                          fontSize: 23  ,
                          fontFamily: 'Gilroy',
                          letterSpacing: 0.8  ,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff171b20),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

// Listview Tiles

                Container(
                  height: 250,
                  width: (mainTab * 3) + 66,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      controller: _scrollController,
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        // 1st Tile

                        SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              globals.tile1Switch = true;
                              globals.tile2Switch = false;
                              globals.tile3Switch = false;
                              globals.tile4Switch = false;
                              _tabController.animateTo(0);

                              HapticFeedback.vibrate();
                            });
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeOut,
                              width: mainTab,
                              height: 200,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent[700].withOpacity(
                                          globals.tile1Switch ? 0.45 : 0),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          7, 10), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(globals.tile1Switch
                                      ? primColor
                                      : secColor)),
                              child: TileData(
                                tileDataWidgets: <Widget>[
                                  Text(
                                    'Notes',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 21,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: globals.tile1Switch
                                            ? actTextColor
                                            : inactHeadTextColor),
                                  ),
                                  SizedBox(
                                    height: 77,
                                  ),
                                  Text(
                                    '$notesCount',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 48,
                                      color: globals.tile1Switch
                                          ? actTextColor
                                          : inactNumTextColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 2nd Tile

                        SizedBox(
                          width: 22,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              globals.tile2Switch = true;
                              globals.tile1Switch = false;
                              globals.tile3Switch = false;
                              globals.tile4Switch = false;
                              _tabController.animateTo(1);
                              HapticFeedback.vibrate();
                            });
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeOut,
                              width: mainTab,
                              height: 200,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent[700].withOpacity(
                                          globals.tile2Switch ? 0.45 : 0),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          7, 10), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(globals.tile2Switch
                                      ? primColor
                                      : secColor)),
                              child: TileData(
                                tileDataWidgets: <Widget>[
                                  Text(
                                    'Important',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 21,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: globals.tile2Switch
                                            ? actTextColor
                                            : inactHeadTextColor),
                                  ),
                                  SizedBox(
                                    height: 77,
                                  ),
                                  Text(
                                    '$importantCount',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 48,
                                      color: globals.tile2Switch
                                          ? actTextColor
                                          : inactNumTextColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 3rd Tile

                        SizedBox(
                          width: 22,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              globals.tile3Switch = true;
                              globals.tile2Switch = false;
                              globals.tile1Switch = false;
                              globals.tile4Switch = false;
                              _tabController.animateTo(2);
                              HapticFeedback.vibrate();
                            });
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeOut,
                              width: mainTab,
                              height: 200,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent[700].withOpacity(
                                          globals.tile3Switch ? 0.45 : 0),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          7, 10),  // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(globals.tile3Switch
                                      ? primColor
                                      : secColor)),
                              child: TileData(
                                tileDataWidgets: <Widget>[
                                  Text(
                                    'Performed',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 21,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: globals.tile3Switch
                                            ? actTextColor
                                            : inactHeadTextColor),
                                  ),
                                  SizedBox(
                                    height: 77,
                                  ),
                                  Text(
                                    '$performedCount',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 48,
                                      color: globals.tile3Switch
                                          ? actTextColor
                                          : inactNumTextColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 4th Tile

                        SizedBox(
                          width: 22,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              globals.tile4Switch = true;
                              globals.tile2Switch = false;
                              globals.tile1Switch = false;
                              globals.tile3Switch = false;
                              _tabController.animateTo(3);
                              HapticFeedback.vibrate();
                            });
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.easeOut,
                              width: mainTab,
                              height: 200,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent[700].withOpacity(
                                          globals.tile4Switch ? 0.45 : 0),
                                      spreadRadius: 0,
                                      blurRadius: 16,
                                      offset: Offset(
                                          7, 10),  // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(globals.tile4Switch
                                      ? primColor
                                      : secColor)),
                              child: TileData(
                                tileDataWidgets: <Widget>[
                                  Text(
                                    'Archived',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 21,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: globals.tile4Switch
                                            ? actTextColor
                                            : inactHeadTextColor),
                                  ),
                                  SizedBox(
                                    height: 77,
                                  ),
                                  Text(
                                    '$archivedCount',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 48,
                                      color: globals.tile4Switch
                                          ? actTextColor
                                          : inactNumTextColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 22,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: Container(
                        height: 400,
                        child: Column(
                          children: <Widget>[
                            MyTabBar(_tabController),
                            Expanded(child: MyTabBarView(_tabController)),
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
