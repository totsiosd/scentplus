import 'package:flutter/material.dart';
import 'package:rbuttons/Utils/commonwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  
       Scaffold(
        // appBar: //CommonAppBar(title:"Perfume Picker Application"),
        appBar: AppBar(
          title: Text("Perfume Picker App"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Image(fit: BoxFit.scaleDown,
                  image: AssetImage('assets/Images/ScentPlus.png'),
                ),
                // CircleAvatar(
                //   child: Image.asset('idsspic.jpg'),
                //   backgroundColor: Colors.blueGrey,
                //   radius: 40.0,
                // ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                
                child: RaisedButton(
                  elevation: 0.0,
                   
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/choosePlace');
                  },
                ),
              ),
            ],
          ),
        ),
       
    );
  }
}
