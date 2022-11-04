import 'package:flutter/material.dart';
import 'package:tickitios/Internal_functions/process_string.dart';

import 'package:tickitios/Net/addtask.dart';

class Bottomfield extends StatelessWidget {
  Bottomfield({Key key, this.color}) : super(key: key);
  final List color;
  final bottomfieldtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Decoration Parameters start
    final kBoxDecorationStyle = BoxDecoration(
      color: Color(color[0]),
      borderRadius: BorderRadius.circular(0.0),
    );
    final kHintTextStyle = TextStyle(
        color: Color(color[1]),
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w300);

    //Decoration Parameters end
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
      decoration: kBoxDecorationStyle,
      height: 81.0,
      child: TextField(
        style: TextStyle(
          color: Color(color[1]),
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 13.0),
          prefixIcon: Icon(
            Icons.add,
            color: Color(color[1]),
            size: 24,
          ),
          hintText: 'Write new task...',
          hintStyle: kHintTextStyle,
        ),
        controller: bottomfieldtext,
        cursorColor: Color(color[1]),
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.dark,
        onSubmitted: (String value) async {
          if (value != "" && value != null) {
            List time_keeper = process_String(value);
            await addtask(time_keeper[0], time_keeper[1]);
            bottomfieldtext.clear();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }
}
