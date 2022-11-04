import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flutter/material.dart';
import 'package:tickitios/Net/updatetheme.dart';

class Themy extends StatelessWidget {
  final int backgroundColor;
  final int textColor;
  final double progress;
  final double size;

  const Themy({
    Key key,
    this.backgroundColor,
    this.textColor,
    @required this.progress,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: GestureDetector(
        onTap: () async {
          await updatetheme(backgroundColor, textColor);
          print("Updated theme done");
          Phoenix.rebirth(context);
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 9.0, spreadRadius: 0.2),
          ], shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: size,
              width: size,
              child: Stack(
                children: [
                  Container(
                    color: Color(textColor),
                  ),
                  // Center(
                  //   child: Icon(
                  //     Icons.colorize,
                  //     color: backgroundColor,
                  //     size: 30,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 45,
                      color: Color(backgroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
