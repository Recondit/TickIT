import 'package:flutter/material.dart';

class Animated extends StatelessWidget {
  const Animated({
    Key key,
    this.task,
    this.getdone,
    this.color,
  }) : super(key: key);

  final String task;
  final String getdone;
  final List color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: Color(color[0]),
        // color: Colors.amber,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      margin: EdgeInsets.fromLTRB(22, 15, 50, 9),
      height: 80,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 63,
            child: RaisedButton(
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(color[1]),
                ),
              ),
              onPressed: () {},
              elevation: 0,
              color: Colors.transparent,
              shape: CircleBorder(
                side: BorderSide(
                  width: 2.3,
                  color: Color(color[1]),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 7, 0)),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
                ),
                Container(
                  child: Text(
                    task,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Color(color[1]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
                getdone != null
                    ? Container(
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            getdone,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(color[1]),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: Text(
                          "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
