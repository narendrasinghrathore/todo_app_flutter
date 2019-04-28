import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLogin extends StatefulWidget {
  @override
  _AppLoginState createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  final _formKey = GlobalKey<FormState>();

  final _headerImage = 'lib/assets/images/sunsetsquare.jpg';

  final circularRadius20 = Radius.circular(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 80 / 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 35.0),
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, -1.0),
                    blurRadius: 10.0),
              ],
              borderRadius: BorderRadius.only(
                topLeft: circularRadius20,
                topRight: circularRadius20,
              ),
              color: Colors.white,
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: circularRadius20,
                          topLeft: circularRadius20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                           _headerImage),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    hasFloatingPlaceholder: true,
                                    alignLabelWithHint: true,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(Icons.email),
                                    ),
                                    labelText: 'Email',
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(
                                        fontSize: 25.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    hasFloatingPlaceholder: true,
                                    alignLabelWithHint: true,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Icon(Icons.lock),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontSize: 25.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: RaisedButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () => {},
                            child: Text(
                              'Login',
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
