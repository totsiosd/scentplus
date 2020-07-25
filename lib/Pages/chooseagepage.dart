import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/Models/getagemodel.dart';
import 'package:perfumepicker/Models/getgiveoffmodel.dart';

class ChooseAge extends StatefulWidget {
  ChooseAge({Key key}) : super(key: key);

  @override
  _ChooseAgeState createState() => _ChooseAgeState();
}

class _ChooseAgeState extends State<ChooseAge> {
  Map attr = {};
  List<String> aromaIds = [];
  List<String> ages = [];
  List<String> selection = [];
  List<String> synopsisList = [];

  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;
    aromaIds = attr['aromaIds'];
    ages = attr['ages'];
    synopsisList = attr['synopsis'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Age"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ListView(padding: EdgeInsets.fromLTRB(40, 20, 40, 0), children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: CustomCheckBoxGroup(
              buttonColor: Theme.of(context).canvasColor,
              buttonLables: ages,
              buttonValuesList: ages,
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
    alertF(context, "No age selected!");
  }

  void _secF() async {
    List<String> newAromaIds = [];
    List<String> giveOffs = []; //This list is passed to the next page
    synopsisList.removeWhere((i) => (i.contains("Age: ")));
    synopsisList.add("Age: " + selection.toString());
    newAromaIds = await getAromaAgeIds(selection, aromaIds);
    giveOffs = await loadGiveOffList(
        aromaIds); //get valid selection values for the next page
    Navigator.of(context).pushNamed('/chooseGiveoff', arguments: {
      'aromaIds': newAromaIds,
      'ages': selection,
      'giveOffs': giveOffs,
      'synopsis': synopsisList,
    });
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
