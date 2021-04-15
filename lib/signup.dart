import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';
import 'package:passman/lowlevel/Algo.dart';
import 'package:passman/viewer.dart';

import 'lowlevel/file.dart';

class Signup extends StatelessWidget {
  Map<String, dynamic> usr = {"usr": "", "pass": ""};
  String pass = "", rpass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  cursorColor: accent,
                  style: TextStyle(
                    fontSize: 30,
                    color: accent,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accent,
                        width: 5,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accent,
                        width: 5,
                      ),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: accent,
                    ),
                  ),
                  onChanged: (t) => {usr["usr"] = t},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                    cursorColor: accent,
                    style: TextStyle(
                      fontSize: 30,
                      color: accent,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accent,
                          width: 5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accent,
                          width: 5,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: accent,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (t) => {pass = t}),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                    cursorColor: accent,
                    style: TextStyle(
                      fontSize: 30,
                      color: accent,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accent,
                          width: 5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accent,
                          width: 5,
                        ),
                      ),
                      hintText: 'Reenter password',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: accent,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (t) => {rpass = t}),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => {
                  if (pass == rpass)
                    {
                      usr["pass"] = hashGen(pass),
                      writeUser(usr),
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Viewer()),
                          (route) => false)
                    }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Passwords didn\'t match'),
                        backgroundColor: accent,
                      ))
                    }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
