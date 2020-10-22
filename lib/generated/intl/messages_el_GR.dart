// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a el_GR locale. All the
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
  String get localeName => 'el_GR';

  static m0(url) => "Could not launch ${url}";

  static m1(name, countryCode) => "Επιλεγμένη γλώσσα ${name} ο κωδικός της χώρας είναι ${countryCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "URLFail" : m0,
    "alertWarning" : MessageLookupByLibrary.simpleMessage("Προειδοποίηση!"),
    "appTitle" : MessageLookupByLibrary.simpleMessage("Perfume picker"),
    "chooseAge" : MessageLookupByLibrary.simpleMessage("Επιλέξτε ηλικία"),
    "chooseGender" : MessageLookupByLibrary.simpleMessage("Επιλέξτε φύλο"),
    "chooseGiveoff" : MessageLookupByLibrary.simpleMessage("Επιλέξτε να δώσετε"),
    "chooseMessage" : MessageLookupByLibrary.simpleMessage("Επιλέξτε μήνυμα"),
    "choosePlace" : MessageLookupByLibrary.simpleMessage("Επιλέξτε χώρο"),
    "goBack" : MessageLookupByLibrary.simpleMessage("Επιστροφή"),
    "gotoSettingsPage" : MessageLookupByLibrary.simpleMessage("Ρυθμίσεις"),
    "languagedescription" : m1,
    "noAgeSelected" : MessageLookupByLibrary.simpleMessage("Δεν επιλέχθηκε ηλικία!"),
    "noGenderSelected" : MessageLookupByLibrary.simpleMessage("Δεν επιλέχθηκε φύλο!"),
    "noGiveoffSelected" : MessageLookupByLibrary.simpleMessage("Δεν επιλέχθηκε απόδοση!"),
    "noMessageSelected" : MessageLookupByLibrary.simpleMessage("Δεν επιλέχθηκε μήνυμα!"),
    "noPlaceSelected" : MessageLookupByLibrary.simpleMessage("Δεν επιλέχθηκε χώρος!"),
    "results" : MessageLookupByLibrary.simpleMessage("Αποτελέσματα"),
    "selectLanguage" : MessageLookupByLibrary.simpleMessage("Επιλέξτε γλώσσα"),
    "selectTheme" : MessageLookupByLibrary.simpleMessage("Επιλέξτε θέμα εμφάνισης"),
    "settingsPage" : MessageLookupByLibrary.simpleMessage("Ρυθμίσεις"),
    "startButton" : MessageLookupByLibrary.simpleMessage("Εκκίνηση"),
    "synopsis" : MessageLookupByLibrary.simpleMessage("Σύνοψη"),
    "synopsisAge" : MessageLookupByLibrary.simpleMessage("Ηλικία :"),
    "synopsisGender" : MessageLookupByLibrary.simpleMessage("Φύλο :"),
    "synopsisGiveoff" : MessageLookupByLibrary.simpleMessage("Αναδίνει :"),
    "synopsisMessage" : MessageLookupByLibrary.simpleMessage("Μήνυμα :")
  };
}
