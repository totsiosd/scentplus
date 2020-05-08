import 'package:flutter/material.dart';
import 'package:rbuttons/Utils/commonwidget.dart';
import 'package:rbuttons/Models/aromalistmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultList extends StatefulWidget {
  ResultList({Key key}) : super(key: key);

  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  Map args = {};
  List<String> aromaIds = [];
  double perc = 0.0;
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
                aromata.sort((a,b)=>b.intense.compareTo(a.intense));
                return ListView.builder(
                  itemCount: aromata.length,
                  itemBuilder: (context, index) {
                    AromaList aroma = aromata[index];
                    switch (aroma.intense) {
                      case "1":
                        perc = 20.0;
                        break;
                      case "2":
                        perc = 40.0;
                        break;
                      case "3":
                        perc = 60.0;
                        break;
                      case "4":
                        perc = 80.0;
                        break;
                      case "5":
                        perc = 100.0;

                        break;
                      default:
                        perc = 0.0;
                    }

                    return Card(
                      elevation: 12.0,
                      child: ListTile(
                        leading: CircularPercentIndicator(
                          radius: 35.0,
                          progressColor: Theme.of(context).toggleableActiveColor,
                          lineWidth: 5.0,
                          animation: true,
                          percent: perc / 100,
                          center: new Text(
                            "${perc.round()}%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 7.0),
                          ),
                        ),
                        /*CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              aroma.intense,
                              style: TextStyle(
                                 // fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  //color: Colors.black54
                                  ),
                            ),
                          ),*/
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
                          style: TextStyle(fontSize: 14.0, letterSpacing: 1.2),
                        ),
                        onTap: () {
                          showDetails(context, '06');
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
