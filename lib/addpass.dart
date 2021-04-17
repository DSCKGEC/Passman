import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';
import 'package:passman/lowlevel/Algo.dart';
import 'package:passman/lowlevel/file.dart';
import 'package:passman/viewer.dart';

class AddPass extends StatelessWidget {
  Map<String, String> data = {};
  Map<String, dynamic> usr = {}, pass_data = {};
  String pass = "";
  String Mpass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      hintText: 'Website',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: accent,
                      ),
                    ),
                    onChanged: (t) => {data['site'] = t}),
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
                      hintText: 'username',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: accent,
                      ),
                    ),
                    onChanged: (t) => {data['uname'] = t}),
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
                      hintText: 'Master Password',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: accent,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (t) => {Mpass = t}),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    usr = await getUser();
                    print(usr);
                    if (usr['pass'] == hashGen(Mpass)) {
                      data['id'] = hashGen(data['site'] + data['uname']);
                      pass_data['key'] = hashGen(data['id']);
                      Mpass = Mpass * 4;
                      Mpass = Mpass.substring(0, 16);
                      pass_data['pair'] = Encrypt(pass, Mpass);
                      await save(data, pass_data);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => ViewerInit()),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Password mismatch'),
                        backgroundColor: accent,
                      ));
                    }
                  },
                  child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
