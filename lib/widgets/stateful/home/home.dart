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
              child: Text(
                'Welcome to Dashboard',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * .3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 12.0,
        onPressed: () {
          // Make sure to call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            // Create a random number generator.
            final random = Random();
            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
