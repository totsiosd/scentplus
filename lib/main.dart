import 'package:flutter/material.dart';
import 'package:perfumepicker/Models/localemodel.dart';
import 'package:perfumepicker/routes/router.dart';

import 'Pages/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/generated/l10n.dart';
import 'package:perfumepicker/themes/themes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AppLocale loc = watch(localeProvider.state);
    bool isDarkTheme = watch(themeProvider).currentTheme ?? false;
    Locale currentLocale = loc.locale;
    print("Current locale on main $currentLocale");
    return MaterialApp(
      //dunamic change of application locale
      locale: currentLocale,
      //dynamic change of theme mode
      theme: isDarkTheme ? darkTheme : lightTheme,
      //supported languages declared in intl generated class
      supportedLocales: S.delegate.supportedLocales,
      //in here we declare the behaviour of the application if user selectes a locale other than the supported ones
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if ((locale.languageCode == deviceLocale.languageCode) &&
              (locale.countryCode == deviceLocale.countryCode)) {
            return locale;
          }
        }
        return supportedLocales.first;
      },
      //localizations delegate classes that take part when one changes the locale property
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      //all routes are handled in a generic way through the Router class
      onGenerateRoute: AppRouter.getRoutes,
      //Declare the home page
      home: HomePage(),
      //title should be dynamically set
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      //no debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
