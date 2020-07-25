import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //margin: EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('assets/Images/idsspic.jpg'),
              fit: BoxFit.scaleDown,
            ),

            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            title: Text(
              '(C) IDSS Intelligent Services',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 10.0,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue),
            ),
            onTap: () async {
              launchURL('http://www.idss.gr');
            },
          ),
        ],
      ),
    );
  }
}
