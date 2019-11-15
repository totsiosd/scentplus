import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void alertF(BuildContext context, String message) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Warning",
      desc: message,
      buttons: [
        // DialogButton(
        //   child: Text(
        //     "FLAT",
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        //   color: Color.fromRGBO(0, 179, 134, 1.0),
        // ),
        DialogButton(
          child: Text(
            "Back",
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

void showDetails(BuildContext context, String aromaid) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        String path = 'assets/Images/';
        print(path);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(path + aromaid.padLeft(2, '0') + '-10-GR.jpg'),
              fit: BoxFit.scaleDown,
            ),
            // FlatButton(
            //   child: Text("Back"),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        );
      });
}

class CommonAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final bool showDrawer;
  final bool showLeading;

  CommonAppBar(
      {@required this.title,
      this.centerTitle = true,
      this.showDrawer = true,
      this.showLeading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
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
      color: Theme.of(context).bottomAppBarColor,
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: firstIcon,
              onPressed: firstF,
            ),
            IconButton(
              icon: homeIcon,
              onPressed: homeF,
            ),
            IconButton(
              icon: secondIcon,
              onPressed: secondF,
            ),
          ],
        ),
      ),
    );
  }
}
