import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(

          ),
        ),
      ),
    );
  }
}