import 'package:flutter/material.dart';
import 'package:rbuttons/Utils/commonwidget.dart';
import 'package:rbuttons/Services/aromalistmodel.dart';

class ResultList extends StatefulWidget {
  ResultList({Key key}) : super(key: key);

  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  Map args = {};
  List<String> aromaIds = [];
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    aromaIds = args['aromaIds'];
    return Scaffold(
        appBar: AppBar(
          title: Text("Results"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
              future: getAromas(aromaIds),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  Center(
                      child: Text(
                    "Error while processing data...",
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  ));
                }
                List<AromaList> aromata = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: aromata.length,
                  itemBuilder: (context, index) {
                    AromaList aroma = aromata[index];
                    return Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              aroma.intense,
                              style: TextStyle(
                                 // fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  //color: Colors.black54
                                  ),
                            ),
                          ),
                          trailing: Icon(Icons.info_outline),
                          // CircleAvatar(
                          //   child: Icon(Icons.info_outline),
                            // onPressed: () {
                            //   alertF(
                            //       context, "Here we present the aroma details");
                            // },
                          //),
                          title: Text(
                            aroma.title,
                            style:
                                TextStyle(fontSize: 14.0, letterSpacing: 1.2),
                          ),
                          onTap: () { showDetails(context, '06');
                            }, 
                          ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    );
                  },
                );
              }),
        ),
        bottomNavigationBar: BottomBar(
          firstF: _firstF,
          secondF: null,
          homeF: _homeF,
          firstIcon: Icon(Icons.navigate_before),
          homeIcon: Icon(Icons.home),
          secondIcon: Icon(Icons.exit_to_app), // Icon(Icons.navigate_next),
        ));
  }

  void _firstF() {
    Navigator.of(context).pop();
  }

  void _homeF() {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
