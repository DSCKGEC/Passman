import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';
import 'package:passman/lowlevel/Algo.dart';
import 'viewer.dart';
import 'lowlevel/file.dart';

class Login extends StatelessWidget {
  final Map<String, dynamic> usr;
  Login(this.usr);
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Icon(
                Icons.account_circle_rounded,
                color: accent,
                size: 150,
              ),
              Container(
                child: Text(
                  usr["usr"],
                  style: TextStyle(
                    fontSize: 30,
                    color: accent,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
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
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => {
                  if (hashGen(pass) == usr["pass"])
                    {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Viewer()),
                          (route) => false)
                    }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong Password'),
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
