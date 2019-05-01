import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCustomWidgets {
  static Scaffold showLogin(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  'You should login first!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Icon(Icons.navigation),
                  padding: EdgeInsets.all(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
