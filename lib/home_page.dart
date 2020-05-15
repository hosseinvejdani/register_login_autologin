import 'package:flutter/material.dart';
import 'package:flutter_auto_login2/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;

  _doLogout() async {
    UserInfo.isLoggedin = false;
    //
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedin', false);
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    name = UserInfo.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'hello $name!!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: _doLogout(),
                child: Text('logout', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
