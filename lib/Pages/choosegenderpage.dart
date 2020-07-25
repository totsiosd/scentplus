import 'package:flutter/material.dart';
import 'package:perfumepicker/Models/getagemodel.dart';
import 'package:perfumepicker/Models/getgendermodel.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ChooseGender extends StatefulWidget {
  ChooseGender({Key key}) : super(key: key);

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  @override
  void initState() {
    super.initState();
  }

  Map attr = {};
  List<String> aromaIds = [];
  List<String> genders = [];
  List<String> selection = [];

  List<String> synopsisList = [];

  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;

    aromaIds = attr['aromaIds'];
    genders = attr['genders'];
    synopsisList = attr['synopsis'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Choose gender"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ListView(padding: EdgeInsets.fromLTRB(40, 20, 40, 0), children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: CustomCheckBoxGroup(
              buttonColor: Theme.of(context).canvasColor,
              buttonLables: genders,
              buttonValuesList: genders,
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
    alertF(context, "No gender selected!");
  }

  void _secF() async {
    List<String> newAromaIds = []; //Aroma ids after the current selections
    List<String> ages = []; //This list is passed to the next page
    synopsisList.removeWhere((i) => (i.contains("Gender: ")));
    synopsisList.add("Gender: " + selection.toString());
    print(synopsisList);
    newAromaIds = await getAromaGenderIds(selection, aromaIds); //Finding ids
    ages = await loadAgeList(
        aromaIds); //get valid selection values for the next page
    Navigator.of(context).pushNamed('/chooseAge', arguments: {
      'aromaIds': newAromaIds,
      'genders': selection,
      'ages': ages,
      'synopsis': synopsisList,
    });
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
