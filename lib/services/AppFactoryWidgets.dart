import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppFactoryWidgets {
  static ScaffoldFeatureController showSpinner(
      BuildContext context, String message) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: 30),
      content: Container(
        height: 100,
        child: Icon(
          Icons.cloud_circle,
        ),
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.deepPurple,
        ),
      ),
    ));
  }
}
