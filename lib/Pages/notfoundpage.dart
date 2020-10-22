import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Icon(
                Icons.device_unknown_outlined,
                size: 50.0,
              ),
              Text('Sorry! Page not found!', style: TextStyle(fontSize: 30.0)),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Go Back", style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
