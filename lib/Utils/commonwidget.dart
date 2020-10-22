import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:perfumepicker/Models/aromaimages.dart';
import 'package:perfumepicker/generated/l10n.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, String url) async {
  // const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw S.of(context).URLFail(url);
  }
}

void alertF(BuildContext context, String message) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: S.of(context).alertWarning,
    desc: message,
    buttons: [
      DialogButton(
        child: Text(
          S.of(context).goBack,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();
}

// void alertF(BuildContext context, String message) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return RichAlertDialog(
//           alertTitle: richTitle("Warning"),
//           alertSubtitle: richSubtitle(message),
//           alertType: RichAlertType.WARNING,
//           actions: <Widget>[
//             FlatButton(
//               child: Text("Back"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       });
// }

void showDetails(BuildContext context, String aromaid) async {
  var path = await getPath(context, aromaid);
  showDialog(
      useSafeArea: true,
      context: context,
      barrierColor: Colors.red,
      barrierDismissible: true,
      builder: (BuildContext context) {
        Size screensize = MediaQuery.of(context).size;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: screensize.height * 0.9,
                width: screensize.width * 0.9,
                image: AssetImage('assets/Images/$path'),
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        );
      });
}

Future<String> getPath(BuildContext context, String aromaId) async {
  final path = await getImagePath(aromaId);
  String res = "";
  if (path.isEmpty)
    res = "scentplus.png";
  else
    res = path;
  return res;
}

class CommonAppBar extends PreferredSize {
  final String title;
  final bool centerTitle;
  final bool showDrawer;
  final bool showLeading;
  final Widget drawer;
  final List<Widget> actions;

  CommonAppBar({
    @required this.title,
    this.centerTitle = true,
    this.showDrawer = false,
    this.showLeading = false,
    this.drawer,
    this.actions,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      //  backgroundColor: Theme.of(context).accentColor,
    );
  }
}

class BottomBar extends StatelessWidget {
  final Function firstF;
  final Function secondF;
  final Function homeF;
  final Icon firstIcon;
  final Icon secondIcon;
  final Icon homeIcon;

  BottomBar(
      {Key key,
      @required this.firstIcon,
      @required this.secondIcon,
      this.homeIcon,
      @required this.firstF,
      @required this.secondF,
      @required this.homeF})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      // color: Theme.of(context).accentColor,
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              onPressed: firstF,
              child: firstIcon,
              elevation: 4.0,
              heroTag: null,
            ),
            // IconButton(
            //   icon: firstIcon,
            //   onPressed: firstF,
            // ),
            FloatingActionButton(
              onPressed: homeF,
              child: homeIcon,
              elevation: 4.0,
              heroTag: null,
            ),
            // IconButton(
            //   icon: homeIcon,
            //   onPressed: homeF,
            // ),
            FloatingActionButton(
              onPressed: secondF,
              child: secondIcon,
              elevation: 4.0,
              heroTag: null,
              isExtended: true,
            ),
            // IconButton(
            //   icon: secondIcon,
            //   onPressed: secondF,
            // ),
          ],
        ),
      ),
    );
  }
}
