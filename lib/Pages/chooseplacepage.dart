import 'package:flutter/material.dart';
import 'package:rbuttons/Models/getgendermodel.dart';
import 'package:rbuttons/Models/getplacesmodel.dart';
import 'package:rbuttons/Models/getaromabycompanymodel.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rbuttons/Utils/commonwidget.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ChoosePlacePage extends StatefulWidget {
  ChoosePlacePage({Key key}) : super(key: key);

  @override
  _ChoosePlacePageState createState() => _ChoosePlacePageState();
}

class _ChoosePlacePageState extends State<ChoosePlacePage> {
  
  List<String> synopsisList = [];
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
    double cwidth = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a place"),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[],
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
                    SizedBox( width: cwidth*0.8,   child: AutoSizeText(txt.data, maxLines: 2, style: txt.style)),
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
    alertF(context, "No place selected!");
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _secF() async {
    List<String> genders = await loadGenderList(aromaIds);
    synopsisList=[];
    synopsisList.add("Place: "+_selectedPlace);
    print(synopsisList);
    Navigator.of(context).pushNamed('/chooseGender',
        arguments: {'aromaIds': aromaIds, 'placeId': _res, 'genders': genders, 'synopsis':synopsisList});
  }

  void _homeF() {
     Navigator.of(context).pushNamedAndRemoveUntil('/home',(route)=>false);
  }
}
