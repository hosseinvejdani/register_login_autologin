import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';
import 'user_info.dart';

class AppLuncher extends StatefulWidget {
  @override
  _AppLuncherState createState() => _AppLuncherState();
}

class _AppLuncherState extends State<AppLuncher> {
  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool _isRegistered = prefs.getBool('isRegistered');
    final bool _isLogedin = prefs.getBool('isLoggedin');
    final String _name = prefs.getString('name');

    if (_isRegistered != null) {
      setState(() {
        UserInfo.isRegistered = _isRegistered;
      });
    } else {
      //go to registeration page
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("register");
      });
      return;
    }

    if (_isLogedin != null) {
      setState(() {
        UserInfo.isLoggedin = _isLogedin;
      });
    } else {
      // go to login page for first time
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("login");
      });
      return;
    }

    if (_isLogedin) {
      UserInfo.name = _name;
      //go to home page
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("home");
      });
      return;
    } else {
      //go to login page
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("login");
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
