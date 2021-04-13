import 'package:flutter/material.dart';
//low level function staus variables
bool lowStat=true;
String lowMsg="";
//theme colors
Color accent=Color(0xFFDF4661);
Color back = Color(0xFF292C33);
Map<int, Color> swatchConfig =
{
  50:Color.fromRGBO(223,70,97, .1),
  100:Color.fromRGBO(223,70,97, .2),
  200:Color.fromRGBO(223,70,97, .3),
  300:Color.fromRGBO(223,70,97, .4),
  400:Color.fromRGBO(223,70,97, .5),
  500:Color.fromRGBO(223,70,97, .6),
  600:Color.fromRGBO(223,70,97, .7),
  700:Color.fromRGBO(223,70,97, .8),
  800:Color.fromRGBO(223,70,97, .9),
  900:Color.fromRGBO(223,70,97, 1),
};
MaterialColor mAccent = MaterialColor(0xFFDF4661, swatchConfig);