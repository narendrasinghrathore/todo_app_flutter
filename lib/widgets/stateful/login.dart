import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Login Page'),
        ),
      ),
      body: Container(padding: EdgeInsets.all(15.0  ),
        child: Column(
          children: <Widget>[Text('Login Page.')],
        ),
      ),
    );
  }
}
