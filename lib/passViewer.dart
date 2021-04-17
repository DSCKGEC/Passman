import 'package:flutter/material.dart';
import 'package:file/file.dart';
import 'package:passman/gloab.dart';
import 'package:passman/lowlevel/Algo.dart';
import 'package:passman/lowlevel/file.dart';
import 'package:passman/widgets.dart';
import 'package:flutter/services.dart';

class PassViewer extends StatelessWidget {
  final Map<String, dynamic> data;
  PassViewer(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: FutureBuilder(
        future: getUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width-15,
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      child: Text(
                        data['site'],
                        style: TextStyle(color: accent, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                width: 5,
                                color: accent,
                              ),
                            )),
                            child: Text(
                              data['uname'],
                              style: TextStyle(color: accent, fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Clipboard.setData(
                                  new ClipboardData(text: data['uname']));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("copied"),
                                  backgroundColor: accent,
                                ),
                              );
                            },
                            child: Text('Copy'))
                      ],
                    ),
                    SizedBox(height: 20,),
                    PasswordInit(hashGen(data['id'])),
                  ],
                ),
              ),),
            );
          }
          return Loading();
        },
      ),
    );
  }
}

class PasswordInit extends StatelessWidget {
  final String id;
  PasswordInit(this.id);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Password(snap.data[id]);
        }
        return Text(
          'processing..',
          style: TextStyle(
            color: accent,
            fontSize: 20,
          ),
        );
      },
    );
  }
}

class Password extends StatefulWidget {
  final List<dynamic> byte_data;
  Password(this.byte_data);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool st = false, show = false;
  String Mpass = "", pass = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: st ? 5 : 0,
                color: accent,
              ),
            )),
            child: st
                ? Text(
                    show ? pass : String.fromCharCode(0x2022) * 15,
                    style: TextStyle(color: accent, fontSize: 30),
                    textAlign: TextAlign.center,
                  )
                : TextField(
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
        ),
        SizedBox(
          width: 10,
        ),
        st
            ? ElevatedButton(
                onPressed: () {
                  show = !show;
                  setState(() {});
                },
                child: Text(show ? 'Hide' : 'Show'))
            : ElevatedButton(
                onPressed: () {
                  if(Mpass.length>3) {
                    Mpass = Mpass * 4;
                    Mpass = Mpass.substring(0, 16);
                  }
                  pass = Decrypt(widget.byte_data.cast<int>(), Mpass);
                  if (lowStat) {
                    st = true;
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password mismatch'),
                        backgroundColor: accent,
                      ),
                    );
                  }
                },
                child: Text('Unlock')),
        SizedBox(
          width: st?10:0,
        ),
        st
            ? ElevatedButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: pass));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("copied"),
                      backgroundColor: accent,
                    ),
                  );
                },
                child: Text('Copy'))
            : Container(),
      ],
    );
  }
}
