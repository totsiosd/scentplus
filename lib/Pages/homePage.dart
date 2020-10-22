import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:perfumepicker/Models/localemodel.dart';
import 'package:perfumepicker/Utils/commonwidget.dart';
import 'package:perfumepicker/generated/l10n.dart';
import 'package:perfumepicker/widgets/drawer.dart';
import 'package:perfumepicker/widgets/langSelection.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        // appBar: //CommonAppBar(title:"Perfume Picker Application"),
        appBar: CommonAppBar(
            title: S.of(context).appTitle, // "This is a appbar title",

            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: langDropDown(context, ""),
                child: LanguageSelection(
                  hint: "",
                ),
              )
            ]),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                width: 200,
                height: 200,
                image: AssetImage('assets/Images/scentplus1.png'),
              ),
              Center(
                child: RaisedButton(
                  elevation: 0.0,
                  child: Text(
                    S.of(context).startButton,
                    style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
                  ),
                  onPressed: () {
                    Locale locale = context.read(localeProvider).currentLocale;
                    Navigator.of(context).pushNamed('/choosePlace',
                        arguments: {'locale': locale});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
