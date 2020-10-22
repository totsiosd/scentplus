import 'package:flutter_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageProvider = StateNotifierProvider<LanguageStateNotifier>((ref) {
  return LanguageStateNotifier();
});

class LanguageStateNotifier extends StateNotifier<Language> {
  static String key = "LocaleRegistrationKey";

  SharedPreferences _preferences;

  LanguageStateNotifier([Language language])
      : super(language ??
            Language(
                id: 1,
                countryCode: 'US',
                flag: 'assets/flags/en.png',
                langCode: 'en',
                name: 'English')) {
    _getLocalePrefs();
  }

  Language get currentLanguage {
    //Language app = state;
    return state;
  }

  void changeLanguage(Language lang) async {
    state = lang;
    await _setLocalePrefs(lang);
  }

  _initPrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _getLocalePrefs() async {
    await _initPrefs();
    String langCode = _preferences.getString(key + "langCode") ?? "en";
    String countryCode = _preferences.getString(key + "countryCode") ?? "US";
    Language check = Language.getLanguages.firstWhere((lang) =>
        (lang.langCode == langCode) && (lang.countryCode == countryCode));
    state = check ??
        Language.getLanguages.firstWhere((lang) => (lang.langCode == "en"));
  }

  _setLocalePrefs(Language val) async {
    await _initPrefs();
    await _preferences.setString(key + "langCode", val.langCode);
    await _preferences.setString(key + "countryCode", val.countryCode);
  }
}

class Language {
  final int id;
  final String langCode;
  final String countryCode;
  final String name;
  final String flag;

  Language({this.id, this.langCode, this.countryCode, this.name, this.flag});

  static List<Language> get getLanguages {
    return <Language>[
      Language(
          id: 1,
          langCode: 'en',
          countryCode: 'US',
          name: 'English',
          flag: 'assets/flags/en.png'),
      Language(
          id: 2,
          langCode: 'el',
          countryCode: 'GR',
          name: 'Ελληνικά',
          flag: 'assets/flags/gr.png'),
      Language(
          id: 3,
          langCode: 'bg',
          countryCode: 'BG',
          name: 'български',
          flag: 'assets/flags/bg.png'),
    ];
  }
}
