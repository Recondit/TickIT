import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickitios/Net/addtheme.dart';

import 'package:tickitios/Net/flutterfire.dart';
import 'package:tickitios/Net/gettheme.dart';
import 'package:tickitios/UI/home.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFFe0e2d4),
        ),
        child: Column(
          children: [
            //TITLE PADDING
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),

            Text(
              "Tick-it",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
            //EMAIL PADDING
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),
            //EMAIL CONTAINER START
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 55,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black, width: 0.8),
              // ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                controller: _emailField,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    alignLabelWithHint: true,

                    //border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    hintText: "Enter Email",
                    contentPadding: EdgeInsets.fromLTRB(5, 7, 0, 7)),
              ),
            ),
            //EMAIL CONTAINER STOP
            //PASSWORD PADDING
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            ),

            //PASSWORD CONTAINER START
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 55,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black, width: 0.8),
              // ),
              child: TextFormField(
                cursorColor: Colors.black,
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusColor: Colors.black,
                    hoverColor: Colors.black,

                    // border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    hintText: "Enter Password",
                    contentPadding: EdgeInsets.fromLTRB(5, 7, 0, 7)),
              ),
            ),
            //PASSWORD CONTAINER STOP
            //LOGIN PADDING
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),

            //LOGIN CONTAINER START
            Container(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black54,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    List pass = await gettheme();
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', _emailField.text);
                    sharedPreferences.setString(
                        'password', _passwordField.text);
                    // navigate router
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homeview(
                          color: pass,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            //LOGIN CONTAINER STOP

            //REGISTER PADDING
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height / 7, 0, 0),
            ),
            //REGISTER CONTAINER START
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    await addtheme();
                    List pass = await gettheme();
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', _emailField.text);
                    sharedPreferences.setString(
                        'password', _passwordField.text);
                    // navigate router
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homeview(
                          color: pass,
                        ),
                      ),
                    );
                  }
                },
                child: Text("New here? Register"),
              ),
            ),
            //REGISTER CONTAINER STOP
          ],
        ),
      ),
    );
  }
}
