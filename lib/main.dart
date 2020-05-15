import 'package:flutter/material.dart';
import 'package:flutter_auto_login2/home_page.dart';
import 'package:flutter_auto_login2/login_screen.dart';
import 'package:flutter_auto_login2/register_screen.dart';
import 'app_luncher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppLuncher(),
        routes: <String, WidgetBuilder>{
          "register": (BuildContext context) => new RegisterScreen(),
          "login": (BuildContext context) => new LoginScreen(),
          "home": (BuildContext context) => new HomePage(),
        });
  }
}
