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
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                Image(width:200,height: 200,
                
                  //fit: BoxFit.fill,
                  image: AssetImage('assets/Images/ScentPlus1.png'),
                ),
                // CircleAvatar(
                //   child: Image.asset('idsspic.jpg'),
                //   backgroundColor: Colors.blueGrey,
                //   radius: 40.0,
                // ),
               
              // SizedBox(
              //   height: 10,
              // ),
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
