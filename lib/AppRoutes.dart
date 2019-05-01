import 'package:flutter/widgets.dart';
import 'package:todo_app_flutter/widgets/stateful/home/home.dart';
import 'package:todo_app_flutter/widgets/stateful/login/login.dart';
import 'package:todo_app_flutter/widgets/stateless/about.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => AppLogin(),
      '/home': (BuildContext context) => AppHome(),
      '/about': (BuildContext context) => AboutPage()
    };
  }
}