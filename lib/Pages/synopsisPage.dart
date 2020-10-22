import 'package:flutter/material.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/generated/l10n.dart';

class SynopsisPage extends StatefulWidget {
  SynopsisPage({Key key}) : super(key: key);

  @override
  _SynopsisPageState createState() => _SynopsisPageState();
}

class _SynopsisPageState extends State<SynopsisPage> {
  Map attr = {};

  List<String> aromaIds = [];

  List<String> synopsisList = [];

  @override
  Widget build(BuildContext context) {
    attr = ModalRoute.of(context).settings.arguments;
    aromaIds = attr['aromaIds'];
    synopsisList = attr['synopsis'];

    return Scaffold(
      appBar: CommonAppBar(
        title: S.of(context).synopsis,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: synopsisList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 12.0,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(1.0)),
              child: ListTile(
                title: Text(
                  synopsisList[index],
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomBar(
        firstF: _firstF,
        secondF: _secF,
        homeF: _homeF,
        firstIcon: Icon(Icons.navigate_before),
        homeIcon: Icon(Icons.home),
        secondIcon: Icon(Icons.navigate_next),
      ),
    );
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _secF() async {
    Navigator.of(context).pushNamed('/resultList', arguments: {
      'aromaIds': aromaIds,
    });
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    // Navigator.of(context).pushReplacementNamed('/home');
  }
}
