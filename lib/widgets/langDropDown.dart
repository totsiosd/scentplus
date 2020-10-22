import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/Models/languages.dart';

import 'package:perfumepicker/Models/localemodel.dart';

DropdownButton<Language> langDropDown(BuildContext context, String hintText) {
  return DropdownButton<Language>(
      hint: Text(hintText, style: TextStyle(fontSize: 16.0)),
      onChanged: (Language lang) {
        context.read(languageProvider).changeLanguage(lang);
        //ο κώδικας αφαιρέθηκε διότι έγινε χρήση του riverpod localprovider!!!
        // context
        //     .read(localeProvider)
        //     .changeLocale(AppLocale(Locale(lang.langCode, lang.countryCode)));
      },
      icon: Icon(Icons.language),
      underline: SizedBox(
        height: 2.0,
      ),
      items: Language.getLanguages
          .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                value: lang,
                child: Row(children: [
                  (context).read(localeProvider.state).locale.languageCode ==
                          lang.langCode
                      ? Icon(Icons.circle,
                          color: Theme.of(context).selectedRowColor, size: 14.0)
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
