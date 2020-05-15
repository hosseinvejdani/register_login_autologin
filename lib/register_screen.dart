import 'package:flutter/material.dart';
import 'package:flutter_auto_login2/home_page.dart';
import 'package:flutter_auto_login2/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name;

  _doRegister() async {
    UserInfo.name = name;
    UserInfo.isRegistered = true;
    UserInfo.isLoggedin = true;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isRegistered', true);
    prefs.setBool('isLoggedin', true);
    prefs.setString('name', name);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register Page'),
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
                onPressed: _doRegister(),
                child: Text('register', style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
