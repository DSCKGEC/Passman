import 'package:flutter/material.dart';
import 'package:passman/login.dart';
import 'package:passman/lowlevel/file.dart';
import 'widgets.dart';
import 'signup.dart';
class Entry extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context,snap){
        if(snap.connectionState==ConnectionState.done){
          if(snap.data==null)
            return Signup();
          if(snap.data["pass"].toString().length>0)
            return Login(snap.data);
          else
            return Signup();
        }
        return Loading();
      },
    );
  }
}