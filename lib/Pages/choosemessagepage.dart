import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/Models/getmessagetypemodel.dart';

class ChooseMessage extends StatefulWidget {
  ChooseMessage({Key key}) : super(key: key);

  @override
  _ChooseMessageState createState() => _ChooseMessageState();
}

class _ChooseMessageState extends State<ChooseMessage> {
  Map attr = {};
  List<String> aromaIds = [];
  List<String> messageTypes = [];
  List<String> selection = [];
  List<String> synopsisList = [];
  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;
    aromaIds = attr['aromaIds'];
    messageTypes = attr['messageTypes'];
    synopsisList = attr['synopsis'];
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Message"),
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
                  buttonLables: messageTypes,
                  buttonValuesList: messageTypes,
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
    alertF(context, "No message selected!");
  }

  void _secF() async {
    List<String> newAromaIds = [];
    print(synopsisList);
    synopsisList.removeWhere((i) => (i.contains("Message: ")));

    print(synopsisList);

    synopsisList.add("Message: " + selection.toString());
    newAromaIds = await getAromaMessageTypeIds(selection, aromaIds);

    Navigator.of(context).pushNamed('/synopsis', arguments: {
      'aromaIds': newAromaIds,
      'synopsis': synopsisList,
    });
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    // Navigator.of(context).pushReplacementNamed('/home');
  }
}
