import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/Models/getgiveoffmodel.dart';
import 'package:perfumepicker/Models/getmessagetypemodel.dart';
import 'package:perfumepicker/generated/l10n.dart';

class ChooseGiveoff extends StatefulWidget {
  final Locale locale;

  ChooseGiveoff({this.locale, Key key}) : super(key: key);

  @override
  _ChooseGiveoffState createState() => _ChooseGiveoffState();
}

class _ChooseGiveoffState extends State<ChooseGiveoff> {
  Map attr = {};
  List<String> aromaIds = [];
  List<String> giveOffs = [];
  List<String> selection = [];
  List<String> synopsisList = [];

  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;
    aromaIds = attr['aromaIds'];
    giveOffs = attr['giveOffs'];
    synopsisList = attr['synopsis'];
    return Scaffold(
        appBar: CommonAppBar(
          title: S.of(context).chooseGiveoff,
          centerTitle: true,
        ),
        body: ListView(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: CustomCheckBoxGroup(
                  enableShape: true,
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
    alertF(context, S.of(context).noGiveoffSelected);
  }

  void _secF() async {
    List<String> newAromaIds = [];
    List<String> messageTypes = [];
    synopsisList
        .removeWhere((i) => (i.contains(S.of(context).synopsisGiveoff)));
    synopsisList.add(S.of(context).synopsisGiveoff + selection.toString());
    newAromaIds = await getAromaGiveOffIds(widget.locale, selection, aromaIds);
    messageTypes = await loadMessageTypeList(widget.locale, aromaIds);
    Navigator.of(context).pushNamed('/chooseMessage', arguments: {
      'locale': widget.locale,
      'aromaIds': newAromaIds,
      'ages': selection,
      'messageTypes': messageTypes,
      'synopsis': synopsisList,
    });
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
