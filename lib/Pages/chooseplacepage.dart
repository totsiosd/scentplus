import 'package:flutter/material.dart';
import 'package:perfumepicker/Models/getgendermodel.dart';
import 'package:perfumepicker/Models/getplacesmodel.dart';
import 'package:perfumepicker/Models/getaromabycompanymodel.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:perfumepicker/generated/l10n.dart';
import 'package:perfumepicker/routes/routes.dart';

class ChoosePlacePage extends StatefulWidget {
  ChoosePlacePage({this.locale, Key key}) : super(key: key);
  final Locale locale;
  @override
  _ChoosePlacePageState createState() => _ChoosePlacePageState();
}

class _ChoosePlacePageState extends State<ChoosePlacePage> {
  Map attr = {};
  List<String> synopsisList = [];
  List<String> places = [];
  List<String> aromaIds = [];
  String _res;

  String _selectedPlace;
  _getPlaces() {
    loadPlaces(widget.locale).then((val) => setState(() {
          places = val;
          //  places.sort((v1,v2){return v1.compareTo(v2);});
        }));
  }

  @override
  void initState() {
    super.initState();
    _getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> places = await loadPlaces();

    double cwidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
        appBar: CommonAppBar(
          title: S.of(context).choosePlace,
          centerTitle: true,
          showDrawer: false,
          showLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            RadioButtonGroup(
              labels: places,
              labelStyle: TextStyle(fontSize: 18.0, letterSpacing: 1.5),
              picked: _selectedPlace,
              orientation: GroupedButtonsOrientation.VERTICAL,
              margin: const EdgeInsets.only(left: 12.0),
              itemBuilder: (Radio rb, Text txt, int i) {
                return Row(
                  children: <Widget>[
                    rb,
                    SizedBox(
                        width: cwidth * 0.8,
                        child: AutoSizeText(txt.data,
                            maxLines: 2, style: txt.style)),
                  ],
                );
              },
              onChange: (String label, int index) {
                //  getPlaceID(label).then((v) {res=v;});
                //first run onChange and then onSelected that's why _res is null at first
              },
              onSelected: (String selected) => setState(() {
                aromaIds = [];

                _selectedPlace = selected;
                getPlaceID(widget.locale, _selectedPlace).then((v) {
                  _res = v;
                }).then((_) {
                  loadAromata(widget.locale, _selectedPlace).then((list) {
                    list.forEach((f) {
                      aromaIds.add(f);
                    });
                  });
                });
              }),
            ),
          ]),
        ),
        bottomNavigationBar: BottomBar(
          firstF: _firstF,
          secondF: (_selectedPlace != null) ? _secF : _alertF,
          homeF: _homeF,
          firstIcon: Icon(Icons.navigate_before),
          homeIcon: Icon(Icons.home),
          secondIcon: Icon(Icons.navigate_next),
        ));
  }

  void _alertF() {
    alertF(context, S.of(context).noPlaceSelected);
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _secF() async {
    List<String> genders = await loadGenderList(widget.locale, aromaIds);
    synopsisList = [];
    synopsisList.add(S.of(context).synopsisPlace + _selectedPlace);
    print(synopsisList);
    Navigator.pushNamed(context, chooseGender, arguments: {
      'locale': widget.locale,
      'aromaIds': aromaIds,
      'placeId': _res,
      'genders': genders,
      'synopsis': synopsisList
    });
  }

  void _homeF() {
    Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
  }
}
