import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/generated/l10n.dart';

import 'package:perfumepicker/routes/routes.dart';
// import 'package:perfumepicker/themes/themes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool isDark = context.read(themeProvider).currentTheme;
    // ThemeData themeData = isDark ? darkTheme : lightTheme

    return Drawer(
        child: Container(
      color: Theme.of(context).accentColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('assets/Images/scentplus.png'),
          ),
          ListTile(
              title: Text(S.of(context).gotoSettingsPage,
                  style: TextStyle(fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, settingsRoute);
              }),
        ],
      ),
    ));
  }
}
