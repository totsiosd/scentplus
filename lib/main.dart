import 'package:flutter/material.dart';
import 'package:rbuttons/Pages/synopsisPage.dart';
import 'Pages/chooseagepage.dart';
import 'Pages/choosegiveoffpage.dart';
import 'Pages/choosemessagepage.dart';
import 'Pages/resultlistpage.dart';
import 'Pages/choosegenderpage.dart';
import 'Pages/chooseplacepage.dart';
import 'Pages/homePage.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          buttonTheme: ButtonThemeData(
           // minWidth: 160.0,
            buttonColor: Colors.deepOrange, 
            textTheme: ButtonTextTheme.primary
            ) ,   
          bottomAppBarColor: Colors.deepOrange, 
          //appBarTheme: AppBarTheme(color: Colors.deepPurple),
        ),
  routes: {
    '/home'          : (context) => HomePage(),
    '/choosePlace'   : (context) => ChoosePlacePage(),
    '/chooseGender'  : (context) => ChooseGender(),
    '/chooseAge'     : (context) => ChooseAge(),
    '/chooseGiveoff' : (context) => ChooseGiveoff(),
    '/chooseMessage' : (context) => ChooseMessage(),
    '/resultList'    : (context) => ResultList(),
    '/synopsis'      : (context) => SynopsisPage(),
  },
));
