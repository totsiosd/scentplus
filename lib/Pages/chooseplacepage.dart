import 'package:flutter/material.dart';
import 'package:rbuttons/Services/getgendermodel.dart';
import 'package:rbuttons/Services/getplacesmodel.dart';
import 'package:rbuttons/Services/getaromabycompanymodel.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rbuttons/Utils/commonwidget.dart';

class ChoosePlacePage extends StatefulWidget {
  ChoosePlacePage({Key key}) : super(key: key);

  @override
  _ChoosePlacePageState createState() => _ChoosePlacePageState();
}

class _ChoosePlacePageState extends State<ChoosePlacePage> {
  List<String> places = [];
  List<String> aromaIds = [];
  String _res;

  String _selectedPlace;
  _getPlaces() {
    loadPlaces().then((val) => setState(() {
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

    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a place"),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: ListView(children: <Widget>[
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
                  txt,
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
              getPlaceID(_selectedPlace).then((v) {
                _res = v;
              }).then((_) {
                loadAromata(_selectedPlace).then((list) {
                  list.forEach((f) {
                    aromaIds.add(f);
                  });
                });
              });
            }),
          ),
        ]),
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
    alertF(context, "No place selected!");
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _secF() async {
    List<String> genders = await loadGenderList(aromaIds);
    Navigator.of(context).pushNamed('/chooseGender',
        arguments: {'aromaIds': aromaIds, 'placeId': _res, 'genders': genders});
  }

  void _homeF() {
     Navigator.of(context).pushNamedAndRemoveUntil('/home',(route)=>false);
  }
}
