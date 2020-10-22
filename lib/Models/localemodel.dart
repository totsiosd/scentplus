import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/Models/languages.dart';

final localeProvider = StateNotifierProvider<LocaleStateNotifier>((ref) {
  final lang = ref.watch(languageProvider.state);

  final Locale locale = Locale(lang.langCode, lang.countryCode);

  return LocaleStateNotifier(AppLocale(locale));
});

class LocaleStateNotifier extends StateNotifier<AppLocale> {
  //LocaleStateNotifier(): super( AppLocale(Locale('en')));

  LocaleStateNotifier([AppLocale locale])
      : super(locale ?? AppLocale(Locale('en')));

  Locale get currentLocale {
    AppLocale app = state;
    return app.locale;
  }

  void changeLocale(AppLocale locale) {
    state = locale;
  }
}

//η κλάση με την οποία παρακολουθούμε τα δεδομένα
class AppLocale {
  final Locale locale;
  Locale get getLocale => locale;
  AppLocale(this.locale);
}
