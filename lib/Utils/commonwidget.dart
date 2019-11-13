import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';

void alertF(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            alertTitle: richTitle("Warning"),
            alertSubtitle: richSubtitle(message),
            alertType: RichAlertType.WARNING,
            actions: <Widget>[
              FlatButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

class CommonAppBar   extends StatelessWidget {

final String title ;
final bool centerTitle ;
final bool showDrawer  ;
final bool showLeading ;

CommonAppBar({@required this.title , this.centerTitle=true, this.showDrawer=true, this.showLeading=false});

@override
Widget build(BuildContext context){
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
   

  BottomBar({ Key key,    @required this.firstIcon, @required this.secondIcon, this.homeIcon,
                     @required this.firstF, @required this.secondF, @required this.homeF}): super(key: key);
  @override
   Widget build( BuildContext context) {
  return BottomAppBar(
    
    elevation: 10.0,
        color: Theme.of(context).bottomAppBarColor,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: firstIcon ,
                onPressed: firstF,
              ),
              IconButton(
                icon: homeIcon ,
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