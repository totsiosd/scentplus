// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(url) => "Could not launch ${url}";

  static m1(name, countryCode) => "Selected language ${name} and  the country code is ${countryCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "URLFail" : m0,
    "alertWarning" : MessageLookupByLibrary.simpleMessage("Warning!"),
    "appTitle" : MessageLookupByLibrary.simpleMessage("Perfume picker"),
    "chooseAge" : MessageLookupByLibrary.simpleMessage("Choose age"),
    "chooseGender" : MessageLookupByLibrary.simpleMessage("Choose gender"),
    "chooseGiveoff" : MessageLookupByLibrary.simpleMessage("Choose give off"),
    "chooseMessage" : MessageLookupByLibrary.simpleMessage("Choose message"),
    "choosePlace" : MessageLookupByLibrary.simpleMessage("Choose a place"),
    "goBack" : MessageLookupByLibrary.simpleMessage("Return"),
    "gotoSettingsPage" : MessageLookupByLibrary.simpleMessage("Settings page"),
    "languagedescription" : m1,
    "noAgeSelected" : MessageLookupByLibrary.simpleMessage("No age selected!"),
    "noGenderSelected" : MessageLookupByLibrary.simpleMessage("No gender selected!"),
    "noGiveoffSelected" : MessageLookupByLibrary.simpleMessage("No give off selected!"),
    "noMessageSelected" : MessageLookupByLibrary.simpleMessage("No message selected!"),
    "noPlaceSelected" : MessageLookupByLibrary.simpleMessage("No place selected!"),
    "results" : MessageLookupByLibrary.simpleMessage("Results"),
    "selectLanguage" : MessageLookupByLibrary.simpleMessage("Select language"),
    "selectTheme" : MessageLookupByLibrary.simpleMessage("Select theme"),
    "settingsPage" : MessageLookupByLibrary.simpleMessage("Settings Page"),
    "startButton" : MessageLookupByLibrary.simpleMessage("Start"),
    "synopsis" : MessageLookupByLibrary.simpleMessage("Synopsis"),
    "synopsisAge" : MessageLookupByLibrary.simpleMessage("Age :"),
    "synopsisGender" : MessageLookupByLibrary.simpleMessage("Gender :"),
    "synopsisGiveoff" : MessageLookupByLibrary.simpleMessage("Give off :"),
    "synopsisMessage" : MessageLookupByLibrary.simpleMessage("Message :"),
    "synopsisPlace" : MessageLookupByLibrary.simpleMessage("Place :")
  };
}
