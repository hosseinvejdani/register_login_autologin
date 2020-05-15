import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_auto_login2/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name;

  void _doLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String _name = prefs.getString('name');
    if (name == _name) {
      prefs.setBool('isLoggedin',true);
      UserInfo.isLoggedin = true;
      UserInfo.name = _name;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("home");
      });
    } else {
      print('username is not correct!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 0.6 * MediaQuery.of(context).size.width,
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text('login', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
