import 'package:passman/gloab.dart';
import 'package:passman/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy name',
      theme: ThemeData(
        primarySwatch: mAccent
      ),
      home: Login(),
    );
  }
}
