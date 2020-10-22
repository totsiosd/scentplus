import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/Models/getagemodel.dart';
import 'package:perfumepicker/Models/getgiveoffmodel.dart';
import 'package:perfumepicker/generated/l10n.dart';

class ChooseAge extends StatefulWidget {
  ChooseAge({this.locale, Key key}) : super(key: key);
  final Locale locale;
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
        appBar: CommonAppBar(
          title: S.of(context).chooseAge,
          centerTitle: true,
        ),
        body: ListView(padding: EdgeInsets.fromLTRB(40, 20, 40, 0), children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: CustomCheckBoxGroup(
              enableShape: true,
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
              selectedColor: Theme.of(context).accentColor,
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
    alertF(context, S.of(context).noAgeSelected);
  }

  void _secF() async {
    List<String> newAromaIds = [];
    List<String> giveOffs = []; //This list is passed to the next page
    synopsisList.removeWhere((i) => (i.contains(S.of(context).synopsisAge)));
    synopsisList.add(S.of(context).synopsisAge + selection.toString());
    newAromaIds = await getAromaAgeIds(widget.locale, selection, aromaIds);
    giveOffs = await loadGiveOffList(
        widget.locale, aromaIds); //get valid selection values for the next page
    Navigator.of(context).pushNamed('/chooseGiveoff', arguments: {
      'locale': widget.locale,
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
