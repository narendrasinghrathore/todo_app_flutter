import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/stateless/home/home.title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            HomeTitle(),
            ],
        ),
      ),
    );
  }
}
