import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:rbuttons/Utils/commonwidget.dart';
import 'package:rbuttons/Models/getgiveoffmodel.dart';
import 'package:rbuttons/Models/getmessagetypemodel.dart';

class ChooseGiveoff extends StatefulWidget {
  ChooseGiveoff({Key key}) : super(key: key);

  @override
  _ChooseGiveoffState createState() => _ChooseGiveoffState();
}

class _ChooseGiveoffState extends State<ChooseGiveoff> {
  Map attr = {};
  List<String> aromaIds = [];
  List<String> giveOffs = [];
  List<String> selection = [];
  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;
    aromaIds = attr['aromaIds'];
    giveOffs = attr['giveOffs'];
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Giveoff"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ListView(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: CustomCheckBoxGroup(
                  buttonColor: Theme.of(context).canvasColor,
                  buttonLables: giveOffs,
                  buttonValuesList: giveOffs,
                  checkBoxButtonValues: (values) {
                    setState(() {
                      selection = [];
                      values.forEach((v) {
                        selection.add(v);
                      });
                      selection.remove(null);
                    });
                  },
                  horizontal: true,
                  width: 70,
                  selectedColor: Theme.of(context).textSelectionHandleColor,
                  padding: 10,
                ),
              ),
            ]),
        bottomNavigationBar: BottomBar(
          firstF: _firstF,
          secondF: (selection.length > 0) ? _secF : _alertF,
          homeF: _homeF,
          firstIcon: Icon(Icons.navigate_before),
          homeIcon: Icon(Icons.home),
          secondIcon: Icon(Icons.navigate_next),
        ));
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _alertF() {
    alertF(context, "No giveoff selected!");
  }

  void _secF() async {
    List<String> newAromaIds = [];
    List<String> messageTypes = [];
    newAromaIds = await getAromaGiveOffIds(selection, aromaIds);
    messageTypes = await loadMessageTypeList(aromaIds);
    Navigator.of(context).pushNamed('/chooseMessage', arguments: {
      'aromaIds': newAromaIds,
      'ages': selection,
      'messageTypes': messageTypes
    });
  }

  void _homeF() {
 Navigator.of(context).pushNamedAndRemoveUntil('/home',(route)=>false);
  }
}
