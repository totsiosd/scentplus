import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/generated/l10n.dart';
import 'package:perfumepicker/Models/languages.dart';
import 'package:perfumepicker/themes/themes.dart';
// import 'package:perfumepicker/widgets/langDropDown.dart';
import 'package:perfumepicker/widgets/langSelection.dart';

class SettingsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Language language = context.read(languageProvider).currentLanguage;
    final bool isDark = context.read(themeProvider).currentTheme;
    print("Build $isDark");
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SwitchListTile(
                    title: Text(S.of(context).selectTheme,
                        style: TextStyle(fontSize: 16.0)),
                    value: isDark,
                    onChanged: (val) =>
                        context.read(themeProvider).changeTheme(val)),
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  title: Text((S.of(context).languagedescription(
                      language.name, language.countryCode))),
                  trailing: Image.asset(
                    '${language.flag}',
                    height: 30,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),

                ListTile(
                  title: LanguageSelection(
                    hint: S.of(context).selectLanguage,
                  ),
                ),

                // langDropDown(context, S.of(context).selectLanguage),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).goBack,
                      style: TextStyle(fontSize: 20.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
