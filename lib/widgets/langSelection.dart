import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/Models/languages.dart';
import 'package:perfumepicker/Models/localemodel.dart';

class LanguageSelection extends ConsumerWidget {
  final String hint;

  const LanguageSelection({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return DropdownButton<Language>(
        hint: Row(
          children: [
            Text(this.hint, style: TextStyle(fontSize: 18.0)),
            SizedBox(
              width: 40.0,
            )
          ],
        ),
        onChanged: (Language lang) {
          context.read(languageProvider).changeLanguage(lang);
        },
        icon: Icon(Icons.language),
        underline: SizedBox(
          height: 2.0,
        ),
        items: Language.getLanguages
            .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    (context).read(localeProvider.state).locale.languageCode ==
                            lang.langCode
                        ? Icon(Icons.circle,
                            color: Theme.of(context).selectedRowColor,
                            size: 14.0)
                        : Icon(
                            Icons.circle,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 14.0,
                          ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 20.0,
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        '${lang.flag}',
                        width: 25.0,
                        height: 18.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      lang.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ]),
                ))
            .toList());
  }
}
