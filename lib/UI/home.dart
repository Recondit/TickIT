import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickitios/Internal_functions/Check_no_more_tasks.dart';
import 'package:tickitios/Internal_functions/find_index.dart';
import 'package:tickitios/Net/addtask.dart';
import 'package:tickitios/Net/deletetask.dart';
import 'package:tickitios/UI/animated.dart';
import 'package:tickitios/UI/appbar.dart';
import 'package:tickitios/UI/bottomtextfield.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:math';

class Homeview extends StatefulWidget {
  Homeview({Key key, this.color}) : super(key: key);
  final List color;

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  //Done responces
  List responses = [
    "Done? Have a coffee then",
    "Congrats! Now take a break",
    "Jeez , You workaholic"
  ];
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Homeappybary(color: widget.color,),
      body: Container(
        color: Color(widget.color[0]),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 90),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser.uid)
              .collection('UserTasks')
              .orderBy("Timestamp", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Color(widget.color[1]),
                ),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                //Container that containes text (Make function later on) START
                return GestureDetector(
                    onDoubleTap: () async {
                      //Deleting task when user taps on it
                      await deletetask("${document.data()['Todo']}");
                      //FlushBar
                      if (await check_no_more_tasks() == true) {
                        Flushbar(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 85),
                          borderRadius: 23,
                          backgroundColor: Color(widget.color[0]),
                          boxShadows: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                color: Colors.black26)
                          ],
                          icon: Icon(Icons.done, color: Color(widget.color[1])),
                          flushbarStyle: FlushbarStyle.FLOATING,
                          barBlur: 12,
                          routeBlur: 12.6,
                          messageText: Text(
                            responses[random.nextInt(3)],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(widget.color[1])),
                          ),
                          duration: Duration(seconds: 2),
                        )..show(context);
                      }
                    },
                    child: Animated(
                      task: "${document.data()['Todo']}",
                      getdone: document.data()['GDB'],
                      color: widget.color,
                    ));

                //Container END
              }).toList(),
            );
          },
        ),
      ),
      bottomSheet: Bottomfield(
        color: widget.color,
      ),
    );
  }
}
