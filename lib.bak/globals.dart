import 'package:flutter/material.dart';

int tabIndex;

bool tile1Switch = true;
bool tile2Switch = false;
bool tile3Switch = false;
bool tile4Switch = false;

double blockSizeHorizontal;
double blockSizeVertical;

int notesCount = 24;
int importantCount = 6;
int performedCount = 34;
int archivedCount = 20;

var primColor = 0xff3F79FE;
var secColor = 0xffF5F7FB;
var actTextColor = Colors.white;
var inactNumTextColor = Color(0xff171b20);
var inactHeadTextColor = Color(0xffC8C9D5);

List<String> reminderHeading = ['Buy some Books','Study for Math test','Book plane Tickets'];
List<String> reminderDesc = ['Buy \n 2 Rough Books and 1 Practical Journal','Study Applications of Differential Calculus for test','Book Airplane Tickets for departure on 14th May'];
List<DateTime> reminderDateTime = [DateTime(2020,1,14,6,45), DateTime(2020,1,21,10,15), DateTime(2020,1,24,13,37)];
