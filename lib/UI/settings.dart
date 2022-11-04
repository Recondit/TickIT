import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tickitios/UI/themesselector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModal extends StatelessWidget {
  const SettingsModal({Key key, this.color}) : super(key: key);
  final List color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: DefaultTabController(
            length: 2,
            child: new Scaffold(
              backgroundColor: Colors.transparent,
              body: TabBarView(
                children: [
                  new ThemeSel(
                    color: color,
                  ),
                  new Container(
                    color: Color(color[0]),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        ),
                        InkWell(
                          onTap: () async {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.remove('email');
                            sharedPreferences.remove('password');
                            Phoenix.rebirth(context);
                          },
                          child: Container(
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                  color: Color(color[0]), fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            height: 50,
                            width: 150,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                                color: Color(color[1]),
                                border: Border.all(color: Color(color[1])),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  elevation: 0,
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Color(color[1])),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: new Icon(Icons.color_lens),
                      ),
                      Tab(
                        icon: new Icon(Icons.construction_sharp),
                      ),
                    ],
                    labelColor: Color(color[1]),
                    unselectedLabelColor: Color(color[1]),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(6.0),
                    indicatorColor: Color(color[1]),
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2.0,
      decoration: BoxDecoration(
        color: Color(color[0]),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
