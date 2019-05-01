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
            begin: Alignment.topCenter,
            colors: [Colors.deepPurple, Colors.black38],
          ),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  'You have to login first!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Icon(Icons.navigation, size: 30,color: Colors.black,),
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
