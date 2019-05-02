import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app_flutter/models/User.dart';
import 'package:todo_app_flutter/services/AppFactoryService.dart';
import 'package:todo_app_flutter/services/AppFactoryWidgets.dart';
import 'package:todo_app_flutter/services/common.service.dart';
import 'package:todo_app_flutter/services/firebase/auth.service.dart';
import 'package:todo_app_flutter/services/user.service.dart';

class AppLogin extends StatefulWidget {
  @override
  _AppLoginState createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  final _formKey = GlobalKey<FormState>();

  final _headerImage = 'lib/assets/images/sunsetsquare.jpg';

  final circularRadius20 = Radius.circular(3);

  final myController = TextEditingController();

  final passwordContorller = TextEditingController();

  final LoginUser _user = new LoginUser();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  ///When the Scaffold is actually created in the same build function, the context argument to the build function can't be used to
  ///find the Scaffold (since it's "above" the widget being returned). In such cases, the following technique with a Builder can
  ///be * used to provide a new scope with a BuildContext that is "under" the Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: Builder(builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: RaisedButton(
            elevation: 8.0,
            color: Colors.deepPurpleAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print('Valid  ${myController.text}');
                // If the form is valid, display a snackbar. In the real world, you'd
                // often want to call a server or save the information in a database

                var auth = AppFactoryService.appFirebaseAuth;
                var a =
                    AppFactoryWidgets.showSpinner(context, 'Authenticating...');

                auth
                    .loginUser(myController.text, passwordContorller.text)
                    .take(1)
                    .listen(
                        (a) {
                          AppUser.user$.add(a);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Authentication done, let's explore ${a.displayName}"),
                          ));
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        cancelOnError: true,
                        onDone: () {
                          a.close();
                        });
              }
            },
            child: Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: new CustomBuilder(
          circularRadius20: circularRadius20,
          headerImage: _headerImage,
          formKey: _formKey,
          emailController: myController,
          passwordController: passwordContorller),
    );
  }
}

class CustomBuilder extends StatelessWidget {
  const CustomBuilder({
    Key key,
    @required this.circularRadius20,
    @required String headerImage,
    @required GlobalKey<FormState> formKey,
    @required this.emailController,
    @required this.passwordController,
  })  : _headerImage = headerImage,
        _formKey = formKey,
        super(key: key);

  final Radius circularRadius20;
  final String _headerImage;
  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
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
                        topRight: circularRadius20, topLeft: circularRadius20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_headerImage),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: buildForm(context),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Form buildForm(BuildContext context) {
    return Form(
      autovalidate: true,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (val) => AppValidator(val)
                      .isRequired('Email required')
                      .validateEmail('Valid email only!')
                      .value,
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
                    labelStyle:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (val) =>
                      AppValidator(val).isRequired('Password required').value,
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
                    labelStyle:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
