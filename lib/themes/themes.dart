import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

// <color name="primaryColor">#ff3d00</color>
// <color name="primaryLightColor">#ff7539</color>
// <color name="primaryDarkColor">#c30000</color>
// <color name="secondaryColor">#ff6e40</color>
// <color name="secondaryLightColor">#ffa06d</color>
// <color name="secondaryDarkColor">#c53d13</color>
// <color name="primaryTextColor">#000000</color>
// <color name="secondaryTextColor">#000000</color>

// ThemeData lightTheme = ThemeData(
//   primaryColor: Color(0xffff3d00),
//   primaryColorDark: Color(0xffc30000),
//   primaryColorLight: Color(0xffff7539),

//   accentColor: Color(0xffff6e40),
//   brightness: Brightness.light,
//   //selectedRowColor: Colors.deepOrange,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   // buttonTheme: ButtonThemeData(
//   //     buttonColor: Colors.deepOrange, textTheme: ButtonTextTheme.primary),
//   // bottomAppBarColor: Colors.deepOrange,
//   // textSelectionHandleColor: Color(0xffb91400),
//   // focusColor: Color(),
//   // toggleableActiveColor: :Color()
//   // //appBarTheme: AppBarTheme(color: Colors.deepPurple),
// );

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  brightness: Brightness.light,
  selectedRowColor: Colors.deepOrange,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepOrange, textTheme: ButtonTextTheme.primary),
  bottomAppBarColor: Colors.deepOrange,
  textSelectionHandleColor: Color(0xffb91400),
  //focusColor: Color(),
  //toggleableActiveColor: :Color()
);
// ThemeData lightTheme = ThemeData(
//   primarySwatch: Colors.blue,
//   brightness: Brightness.light,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
// );
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  brightness: Brightness.dark,
  selectedRowColor: Colors.lightGreen,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomAppBarColor: Colors.lightGreen,
);

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends ChangeNotifier {
  final String key = "themeRegistration";

  bool _isDark;

  SharedPreferences _preferences;

  ThemeNotifier([_isDark = false]) {
    _getThemePrefs();
  }

  changeTheme(bool val) async {
    _isDark = val;
    notifyListeners();
    await setThemePrefs(val);
  }

  bool get currentTheme => _isDark;

  _initPrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  setThemePrefs(bool val) async {
    await _initPrefs();
    await _preferences.setBool(key, val);
  }

  _getThemePrefs() async {
    await _initPrefs();
    _isDark = _preferences.getBool(key) ?? false;
    notifyListeners();
  }
}
