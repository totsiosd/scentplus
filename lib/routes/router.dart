import 'package:flutter/material.dart';
import 'package:perfumepicker/Pages/chooseagepage.dart';
import 'package:perfumepicker/Pages/choosegenderpage.dart';
import 'package:perfumepicker/Pages/choosegiveoffpage.dart';
import 'package:perfumepicker/Pages/choosemessagepage.dart';
import 'package:perfumepicker/Pages/chooseplacepage.dart';
import 'package:perfumepicker/Pages/homePage.dart';
import 'package:perfumepicker/Pages/notfoundpage.dart';
import 'package:perfumepicker/Pages/resultlistpage.dart';
import 'package:perfumepicker/Pages/settingspage.dart';
import 'package:perfumepicker/Pages/synopsisPage.dart';
import 'package:perfumepicker/routes/routes.dart';

class AppRouter {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomePage(), settings: settings);
        break;
      case settingsRoute:
        return MaterialPageRoute(
            builder: (_) => SettingsPage(), settings: settings);
        break;
      case chooseAge:
        return MaterialPageRoute(
            builder: (context) {
              Map attr = settings.arguments;
              Locale locale = attr['locale'];
              return ChooseAge(
                locale: locale,
              );
            },
            settings: settings);
        break;
      case chooseGender:
        return MaterialPageRoute(
            builder: (context) {
              Map attr = settings.arguments;
              Locale locale = attr['locale'];
              return ChooseGender(
                locale: locale,
              );
            },
            settings: settings);
        break;
      case chooseGiveOff:
        return MaterialPageRoute(
            builder: (context) {
              Map attr = settings.arguments;
              Locale locale = attr['locale'];
              return ChooseGiveoff(
                locale: locale,
              );
            },
            settings: settings);
        break;
      case chooseMessage:
        return MaterialPageRoute(
            builder: (context) {
              Map attr = settings.arguments;
              Locale locale = attr['locale'];
              return ChooseMessage(
                locale: locale,
              );
            },
            settings: settings);
        break;
      case choosePlace:
        return MaterialPageRoute(
            builder: (context) {
              Map attr = settings.arguments;
              Locale locale = attr['locale'];
              return ChoosePlacePage(
                locale: locale,
              );
            },
            settings: settings);
        break;
      case synopsisRoute:
        return MaterialPageRoute(
            builder: (_) => SynopsisPage(), settings: settings);
        break;
      case resultList:
        return MaterialPageRoute(
            builder: (_) => ResultList(), settings: settings);
        break;
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
