import 'package:flutter/material.dart';
import 'package:passman/gloab.dart';

class Login extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width-50,
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

                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-50,
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

                  ),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: ()=>{},
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child:Text(
                'Login',
                style: TextStyle(
                  fontSize: 30
                ),
              ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
