import 'dart:ui';
import 'screen_blocks.dart';
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
          _scrollController.animateTo(globals.blockSizeHorizontal * 75,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }

        if (_tabController.index == 3) {
          globals.tile4Switch = true;
          globals.tile2Switch = false;
          globals.tile3Switch = false;
          globals.tile1Switch = false;
          _scrollController.animateTo(globals.blockSizeHorizontal * 75,
              curve: Curves.easeOut, duration: Duration(milliseconds: 400));
        }
      });
    });
  }

  // Vars for 1st page appearance
  var avatarLocation = 'assets/images/avatar.jpg';
  var userName = 'Amoong Banjo';
  

  // Vars for notes data
  

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double mainTabWidth = SizeConfig.blockSizeHorizontal * 36;
    double mainTabHeight = SizeConfig.blockSizeVertical * 23;
    double mainTabRadius = SizeConfig.blockSizeHorizontal * 4.5;
    globals.blockSizeHorizontal = SizeConfig.blockSizeHorizontal;
    globals.blockSizeVertical = SizeConfig.blockSizeVertical;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),

// User details row

              Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 7,
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
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 3.5),
                      child: Image.asset(
                        avatarLocation,
                        height: SizeConfig.blockSizeVertical * 6,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  Expanded(
                    child: Text(userName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          fontFamily: 'Gilroy',
                          letterSpacing: SizeConfig.blockSizeHorizontal * 0.2,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff171b20),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),

// Listview Tiles

              Container(
                height: SizeConfig.blockSizeVertical * 27,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    controller: _scrollController,
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      // 1st Tile

                      SizedBox(width: SizeConfig.blockSizeHorizontal * 7),
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
                            width: mainTabWidth,
                            height: mainTabHeight,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent[700].withOpacity(
                                        globals.tile1Switch ? 0.38 : 0),
                                    spreadRadius: 0,
                                    blurRadius: 16,
                                    offset: Offset(
                                        7, 10), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.circular(mainTabRadius),
                                color: Color(globals.tile1Switch
                                    ? globals.primColor
                                    : globals.secColor)),
                            child: TileData(
                              tileDataWidgets: <Widget>[
                                Text(
                                  'Reminders',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      letterSpacing:
                                          SizeConfig.blockSizeHorizontal * 0.29,
                                      fontWeight: FontWeight.bold,
                                      color: globals.tile1Switch
                                          ? globals.actTextColor
                                          : globals.inactHeadTextColor),
                                ),
                                SizedBox(
                                  height: mainTabHeight -
                                      SizeConfig.blockSizeVertical * 15,
                                ),
                                Text(
                                  '${globals.notesCount}',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    letterSpacing:
                                        SizeConfig.blockSizeHorizontal * 0.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 12,
                                    color: globals.tile1Switch
                                        ? globals.actTextColor
                                        : globals.inactNumTextColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 2nd Tile

                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 6,
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
                            width: mainTabWidth,
                            height: mainTabHeight,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent[700].withOpacity(
                                        globals.tile2Switch ? 0.38 : 0),
                                    spreadRadius: 0,
                                    blurRadius: 16,
                                    offset: Offset(
                                        7, 10), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.circular(mainTabRadius),
                                color: Color(globals.tile2Switch
                                    ? globals.primColor
                                    : globals.secColor)),
                            child: TileData(
                              tileDataWidgets: <Widget>[
                                Text(
                                  'Important',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      letterSpacing:
                                          SizeConfig.blockSizeHorizontal * 0.29,
                                      fontWeight: FontWeight.bold,
                                      color: globals.tile2Switch
                                          ? globals.actTextColor
                                          : globals.inactHeadTextColor),
                                ),
                                SizedBox(
                                  height: mainTabHeight -
                                      SizeConfig.blockSizeVertical * 15,
                                ),
                                Text(
                                  '${globals.importantCount}',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    letterSpacing:
                                        SizeConfig.blockSizeHorizontal * 0.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 12,
                                    color: globals.tile2Switch
                                        ? globals.actTextColor
                                        : globals.inactNumTextColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 3rd Tile

                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 6,
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
                            width: mainTabWidth,
                            height: mainTabHeight,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent[700].withOpacity(
                                        globals.tile3Switch ? 0.38 : 0),
                                    spreadRadius: 0,
                                    blurRadius: 16,
                                    offset: Offset(
                                        7, 10), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.circular(mainTabRadius),
                                color: Color(globals.tile3Switch
                                    ? globals.primColor
                                    : globals.secColor)),
                            child: TileData(
                              tileDataWidgets: <Widget>[
                                Text(
                                  'Performed',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      letterSpacing:
                                          SizeConfig.blockSizeHorizontal * 0.29,
                                      fontWeight: FontWeight.bold,
                                      color: globals.tile3Switch
                                          ? globals.actTextColor
                                          : globals.inactHeadTextColor),
                                ),
                                SizedBox(
                                  height: mainTabHeight -
                                      SizeConfig.blockSizeVertical * 15,
                                ),
                                Text(
                                  '${globals.performedCount}',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    letterSpacing:
                                        SizeConfig.blockSizeHorizontal * 0.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 12,
                                    color: globals.tile3Switch
                                        ? globals.actTextColor
                                        : globals.inactNumTextColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 4th Tile

                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 6,
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
                            width: mainTabWidth,
                            height: mainTabHeight,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent[700].withOpacity(
                                        globals.tile4Switch ? 0.38 : 0),
                                    spreadRadius: 0,
                                    blurRadius: 16,
                                    offset: Offset(
                                        7, 10), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.circular(mainTabRadius),
                                color: Color(globals.tile4Switch
                                    ? globals.primColor
                                    : globals.secColor)),
                            child: TileData(
                              tileDataWidgets: <Widget>[
                                Text(
                                  'Archived',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      letterSpacing:
                                          SizeConfig.blockSizeHorizontal * 0.29,
                                      fontWeight: FontWeight.bold,
                                      color: globals.tile4Switch
                                          ? globals.actTextColor
                                          : globals.inactHeadTextColor),
                                ),
                                SizedBox(
                                  height: mainTabHeight -
                                      SizeConfig.blockSizeVertical * 15,
                                ),
                                Text(
                                  '${globals.archivedCount}',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    letterSpacing:
                                        SizeConfig.blockSizeHorizontal * 0.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 12,
                                    color: globals.tile4Switch
                                        ? globals.actTextColor
                                        : globals.inactNumTextColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 6,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: Container(
                      height: SizeConfig.blockSizeVertical * 56,
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
    );
  }
}
