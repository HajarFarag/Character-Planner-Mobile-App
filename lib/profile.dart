import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'stats.dart';


class profile extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<profile> {
  get _emailFieldController => "";
  get _nameSignUp => "";

  @override

  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.orangeAccent,
      ),

      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image.asset('assets/login.png'),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: Text('Name: $_nameSignUp', style: TextStyle(color: Colors.white),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: Text('Email: $_emailFieldController', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Container(
              child: RaisedButton(onPressed: () {  },

              ),

            ),


          ],
        ),
      ),
      backgroundColor: Colors.black54,
    );
  }
}
