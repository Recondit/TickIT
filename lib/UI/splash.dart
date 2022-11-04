import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickitios/Net/flutterfire.dart';
import 'package:tickitios/Net/gettheme.dart';
import 'package:tickitios/UI/authentication.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    valid();
    super.initState();
  }

  Future valid() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obemail = sharedPreferences.getString('email');
    var obepass = sharedPreferences.getString('password');
    if (obemail == null && obepass == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Authentication(),
        ),
      );
    } else {
      bool shouldNavigate = await signIn(obemail, obepass);
      if (shouldNavigate) {
        List pass = await gettheme();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homeview(
              color: pass,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Authentication(),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 225, 0, 0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFe0e2d4),
          child: Column(
            children: [
              IconButton(
                icon: Image.asset('assets/icons/Icon_tickit.png'),
                onPressed: null,
                iconSize: 150,
              ),
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
