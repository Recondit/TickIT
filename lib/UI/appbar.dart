import 'package:flutter/material.dart';
import 'package:tickitios/UI/settings.dart';

class Homeappybary extends StatelessWidget implements PreferredSizeWidget {
  Homeappybary({Key key, this.color}) : super(key: key);

  final List color;

  @override
  Size get preferredSize => const Size.fromHeight(60);
  Widget build(BuildContext context) {
    _showModalBottomSheet(context) {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return SettingsModal(color: color);
          });
    }

    return AppBar(
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: Icon(
                Icons.settings_sharp,
                size: 20.0,
                color: Color(color[1]),
              ),
            )),
      ],
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0)),
            ],
          ),
        ],
      ),
      leadingWidth: 70,
      centerTitle: false,
      titleSpacing: 20,
      title: Text(
        "Tick-it",
        style: TextStyle(
          color: Color(color[1]),
          fontSize: 30,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.left,
      ),
      backgroundColor: Color(color[0]),
      /*Scaffold back colors*/
      elevation: 0,
    );
  }
}
