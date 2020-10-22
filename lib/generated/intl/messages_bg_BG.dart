// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bg_BG locale. All the
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
  String get localeName => 'bg_BG';

  static m0(url) => "Could not launch ${url}";

  static m1(name, countryCode) => "Избраният език ${name} код на държавата е ${countryCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "URLFail" : m0,
    "alertWarning" : MessageLookupByLibrary.simpleMessage("Внимание!"),
    "appTitle" : MessageLookupByLibrary.simpleMessage("Perfume picker"),
    "chooseAge" : MessageLookupByLibrary.simpleMessage("Изберете възраст"),
    "chooseGender" : MessageLookupByLibrary.simpleMessage("Изберете пол"),
    "chooseGiveoff" : MessageLookupByLibrary.simpleMessage("Изберете раздаване"),
    "chooseMessage" : MessageLookupByLibrary.simpleMessage("Изберете съобщение"),
    "choosePlace" : MessageLookupByLibrary.simpleMessage("Изберете място"),
    "goBack" : MessageLookupByLibrary.simpleMessage("Връщане"),
    "gotoSettingsPage" : MessageLookupByLibrary.simpleMessage("Към страницата с настройки"),
    "languagedescription" : m1,
    "noAgeSelected" : MessageLookupByLibrary.simpleMessage("Не е избрана възраст!"),
    "noGenderSelected" : MessageLookupByLibrary.simpleMessage("Не е избран пол!"),
    "noGiveoffSelected" : MessageLookupByLibrary.simpleMessage("Не е избрано шоу!"),
    "noMessageSelected" : MessageLookupByLibrary.simpleMessage("Няма избрано съобщение!"),
    "noPlaceSelected" : MessageLookupByLibrary.simpleMessage("Няма избрано място!"),
    "results" : MessageLookupByLibrary.simpleMessage(""),
    "selectLanguage" : MessageLookupByLibrary.simpleMessage("изберете език"),
    "selectTheme" : MessageLookupByLibrary.simpleMessage("Изберете тема на външния вид"),
    "settingsPage" : MessageLookupByLibrary.simpleMessage("Страница с настройки"),
    "startButton" : MessageLookupByLibrary.simpleMessage("Започнете"),
    "synopsis" : MessageLookupByLibrary.simpleMessage("Обобщение"),
    "synopsisAge" : MessageLookupByLibrary.simpleMessage("Възраст :"),
    "synopsisGender" : MessageLookupByLibrary.simpleMessage("Пол :"),
    "synopsisGiveoff" : MessageLookupByLibrary.simpleMessage("Предавайте :"),
    "synopsisMessage" : MessageLookupByLibrary.simpleMessage("Съобщение :")
  };
}
