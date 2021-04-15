import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';
class Viewer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add),
        backgroundColor: accent,
        onPressed: null,
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}