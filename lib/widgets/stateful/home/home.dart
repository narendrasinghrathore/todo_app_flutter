import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_flutter/services/user.service.dart';
import 'package:todo_app_flutter/widgets/stateless/AppCustomWidgets.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final user = AppUser.user;
  // Whether the green box should be visible or invisible
  bool _visible = true;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Color _color = Colors.green;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return AppCustomWidgets.showLogin(context);
    } else {
      return showHome(context);
    }
  }

  Scaffold showHome(context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Welcome, ${user.displayName}',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  softWrap: true,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * .3,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        highlightElevation: 12.0,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    titleTextStyle:
                        TextStyle(color: Colors.deepPurple, fontSize: 24),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Update'),
                        onPressed: () {
                           Navigator.of(context).pop();
                        },
                      ),
                    ],
                    title: Text(user.displayName),
                    content: SizedBox(
                      // height: MediaQuery.of(context).size.height / 4 * .2,
                      child: TextFormField(
                        style: TextStyle(color: Colors.deepPurple),
                        initialValue: user.displayName,
                      ),
                    ),
                  ));
        },
        tooltip: 'Profile Setting',
        child: Icon(
          Icons.person,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
