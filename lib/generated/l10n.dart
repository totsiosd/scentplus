// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Perfume picker`
  String get appTitle {
    return Intl.message(
      'Perfume picker',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get startButton {
    return Intl.message(
      'Start',
      name: 'startButton',
      desc: '',
      args: [],
    );
  }

  /// `Choose a place`
  String get choosePlace {
    return Intl.message(
      'Choose a place',
      name: 'choosePlace',
      desc: '',
      args: [],
    );
  }

  /// `No place selected!`
  String get noPlaceSelected {
    return Intl.message(
      'No place selected!',
      name: 'noPlaceSelected',
      desc: '',
      args: [],
    );
  }

  /// `Choose gender`
  String get chooseGender {
    return Intl.message(
      'Choose gender',
      name: 'chooseGender',
      desc: '',
      args: [],
    );
  }

  /// `No gender selected!`
  String get noGenderSelected {
    return Intl.message(
      'No gender selected!',
      name: 'noGenderSelected',
      desc: '',
      args: [],
    );
  }

  /// `Choose give off`
  String get chooseGiveoff {
    return Intl.message(
      'Choose give off',
      name: 'chooseGiveoff',
      desc: '',
      args: [],
    );
  }

  /// `No give off selected!`
  String get noGiveoffSelected {
    return Intl.message(
      'No give off selected!',
      name: 'noGiveoffSelected',
      desc: '',
      args: [],
    );
  }

  /// `Choose age`
  String get chooseAge {
    return Intl.message(
      'Choose age',
      name: 'chooseAge',
      desc: '',
      args: [],
    );
  }

  /// `No age selected!`
  String get noAgeSelected {
    return Intl.message(
      'No age selected!',
      name: 'noAgeSelected',
      desc: '',
      args: [],
    );
  }

  /// `Choose message`
  String get chooseMessage {
    return Intl.message(
      'Choose message',
      name: 'chooseMessage',
      desc: '',
      args: [],
    );
  }

  /// `No message selected!`
  String get noMessageSelected {
    return Intl.message(
      'No message selected!',
      name: 'noMessageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Synopsis`
  String get synopsis {
    return Intl.message(
      'Synopsis',
      name: 'synopsis',
      desc: '',
      args: [],
    );
  }

  /// `Place :`
  String get synopsisPlace {
    return Intl.message(
      'Place :',
      name: 'synopsisPlace',
      desc: '',
      args: [],
    );
  }

  /// `Gender :`
  String get synopsisGender {
    return Intl.message(
      'Gender :',
      name: 'synopsisGender',
      desc: '',
      args: [],
    );
  }

  /// `Age :`
  String get synopsisAge {
    return Intl.message(
      'Age :',
      name: 'synopsisAge',
      desc: '',
      args: [],
    );
  }

  /// `Give off :`
  String get synopsisGiveoff {
    return Intl.message(
      'Give off :',
      name: 'synopsisGiveoff',
      desc: '',
      args: [],
    );
  }

  /// `Message :`
  String get synopsisMessage {
    return Intl.message(
      'Message :',
      name: 'synopsisMessage',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Settings Page`
  String get settingsPage {
    return Intl.message(
      'Settings Page',
      name: 'settingsPage',
      desc: '',
      args: [],
    );
  }

  /// `Settings page`
  String get gotoSettingsPage {
    return Intl.message(
      'Settings page',
      name: 'gotoSettingsPage',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get goBack {
    return Intl.message(
      'Return',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Selected language {name} and  the country code is {countryCode}`
  String languagedescription(Object name, Object countryCode) {
    return Intl.message(
      'Selected language $name and  the country code is $countryCode',
      name: 'languagedescription',
      desc: '',
      args: [name, countryCode],
    );
  }

  /// `Select theme`
  String get selectTheme {
    return Intl.message(
      'Select theme',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Warning!`
  String get alertWarning {
    return Intl.message(
      'Warning!',
      name: 'alertWarning',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch {url}`
  String URLFail(Object url) {
    return Intl.message(
      'Could not launch $url',
      name: 'URLFail',
      desc: '',
      args: [url],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bg', countryCode: 'BG'),
      Locale.fromSubtags(languageCode: 'el', countryCode: 'GR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}