// To parse this JSON data, do
//
//     final giveOff = giveOffFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:perfumepicker/Utils/constants.dart';

List<GiveOff> giveOffFromJson(String str) =>
    List<GiveOff>.from(json.decode(str).map((x) => GiveOff.fromJson(x)));

String giveOffToJson(List<GiveOff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GiveOff {
  GiveOff({
    this.aromadescr,
    this.isactive,
    this.messagedescr,
    this.messagedescrEn,
    this.categoryRootEn,
    this.id,
    this.categoryRoot,
    this.aromaId,
  });

  String aromadescr;
  String isactive;
  String messagedescr;
  String messagedescrEn;
  String categoryRootEn;
  String id;
  String categoryRoot;
  String aromaId;

  factory GiveOff.fromJson(Map<String, dynamic> json) => GiveOff(
        aromadescr: json["AROMADESCR"],
        isactive: json["ISACTIVE"],
        messagedescr: json["MESSAGEDESCR"],
        messagedescrEn: json["MESSAGEDESCR_EN"],
        categoryRootEn: json["CategoryRoot_En"],
        id: json["id"],
        categoryRoot: json["CategoryRoot"],
        aromaId: json["AromaID"],
      );

  Map<String, dynamic> toJson() => {
        "AROMADESCR": aromadescr,
        "ISACTIVE": isactive,
        "MESSAGEDESCR": messagedescr,
        "MESSAGEDESCR_EN": messagedescrEn,
        "CategoryRoot_En": categoryRootEn,
        "id": id,
        "CategoryRoot": categoryRoot,
        "AromaID": aromaId,
      };
}

/*
Αφού επιλεγούν τα στοιχεία τότε με βάση το αρχείο βρίσκω ποια αρώματα έχουν αυτά τα στοιχεία
και από την λίστα αρωμάτων όπως αυτή είχε διαμορφωθεί στα προηγούμενα βήματα περιορίζω το
αποτέλεσμα με το επιπλέον κριτήριο
*/
Future<String> _loadGiveOffAsset() async {
  return await rootBundle.loadString('assets/messagedetails.json');
}

Future<List<String>> getAromaGiveOffIds(
    Locale locale, List<String> giveOffs, List<String> inAromaIds) async {
  String jsonString = await _loadGiveOffAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<GiveOff> records = jsonBody.map((f) => GiveOff.fromJson(f)).toList();
  List<String> res = [];
  records.where((i) {
    String element = locale.languageCode == GREEKLANGUAGECODE
        ? i.messagedescr
        : i.messagedescrEn;
    return ((giveOffs.indexOf(element) >= 0) &&
        (i.isactive == "1") &&
        (inAromaIds.indexOf(i.aromaId) >= 0));
  }).forEach((v) {
    res.add(v.aromaId);
  });
  res = res.toSet().toList();
  return res;
}

Future<List<String>> loadGiveOffList(
    Locale locale, List<String> aromataIds) async {
  String jsonString = await _loadGiveOffAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<GiveOff> records = jsonBody.map((f) => GiveOff.fromJson(f)).toList();
  List<String> res = [];
  records.where((i) {
    return (aromataIds.indexOf(i.aromaId) >= 0);
  }).forEach((v) {
    if ((v.categoryRootEn == "Giveoff") && (v.isactive == "1"))
      res.add(locale.languageCode == GREEKLANGUAGECODE
          ? v.messagedescr
          : v.messagedescrEn);
  });
  res = res.toSet().toList();

  return res;
}
