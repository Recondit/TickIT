import 'package:flutter/material.dart';
import 'package:tickitios/UI/Them.dart';

class ThemeSel extends StatelessWidget {
  const ThemeSel({Key key, this.color}) : super(key: key);
  final List color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(64, 114, 174, 100),
      // color: Color.fromRGBO(26, 28, 37, 100),

      color: Color(color[0]),
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: <Widget>[
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFFe0e2d4,
            textColor: 0xFF000000,
          ),
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFF1a1c25,
            textColor: 0xFF4072ae,
          ),
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFF7395AE,
            textColor: 0xFF1a1c25,
          ),
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFF5D5C61,
            textColor: 0xFFfae52d,
          ),
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFF143D59,
            textColor: 0xFFF4B41A,
          ),
          Themy(
            progress: 0.7,
            size: 50,
            backgroundColor: 0xFFFBEEC1,
            textColor: 0xFFBC986A,
          ),

          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color.fromRGBO(26, 28, 37, 100),
          //   textColor: Color.fromRGBO(64, 114, 174, 100),
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Colors.amber,
          //   textColor: Colors.black,
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Colors.black,
          //   textColor: Colors.white,
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFF5D5C61),
          //   textColor: Colors.yellow,
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFF143D59),
          //   textColor: Color(0xFFF4B41A),
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFF8D8741),
          //   textColor: Color(0xFF659DBD),
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFFFBEEC1),
          //   textColor: Color(0xFFBC986A),
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFFEDF5E1),
          //   textColor: Color(0xFF05386B),
          // ),
          // Themy(
          //   progress: 0.7,
          //   size: 50,
          //   backgroundColor: Color(0xFFB1A296),
          //   textColor: Color(0xFF7395AE),
          // ),
        ],
      ),
    );
  }
}
