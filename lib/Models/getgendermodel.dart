// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:perfumepicker/Utils/constants.dart';

List<Gender> genderFromJson(String str) =>
    List<Gender>.from(json.decode(str).map((x) => Gender.fromJson(x)));

String genderToJson(List<Gender> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gender {
  Gender({
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

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
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

const String JSONFILE = 'assets/messagedetails.json';

Future<String> _loadGenderAsset() async {
  return await rootBundle.loadString(JSONFILE);
}

Future<List<String>> loadGenderList(
    Locale locale, List<String> aromataIds) async {
  String jsonString = await _loadGenderAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = jsonBody.map((f) => Gender.fromJson(f)).toList();
  List<String> res = [];
  print(aromataIds);
  records.where((i) {
    return (aromataIds.indexOf(i.aromaId) >= 0) && (i.isactive == "1");
  }).forEach((v) {
    if (v.categoryRootEn == "Gender")
      res.add(locale.languageCode == GREEKLANGUAGECODE
          ? v.messagedescr
          : v.messagedescrEn);
  });
  res = res.toSet().toList();

  return res;
}

Future<List<String>> getAromaGenderIds(
    Locale locale, List<String> genders, List<String> inAromaIds) async {
  String jsonString = await _loadGenderAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = jsonBody.map((f) => Gender.fromJson(f)).toList();
  List<String> res = [];
  records.where((i) {
    String element = locale.languageCode == GREEKLANGUAGECODE
        ? i.messagedescr
        : i.messagedescrEn;
    return ((genders.indexOf(element) >= 0) &&
        (i.isactive == "1") &&
        (inAromaIds.indexOf(i.aromaId) >= 0));
  }).forEach((v) {
    res.add(v.aromaId);
  });
  res = res.toSet().toList();

  return res;
}

Future<List<String>> getGenders() async {
  String jsonString = await _loadGenderAsset();
  //print(jsonString);
  //Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = genderFromJson(jsonString);
  // jsonBody.map((f) => Gender.fromJson(f)).toList();
  List<String> res = [];
  records.forEach((v) {
    if (v.categoryRoot == "Φύλο") res.add(v.messagedescr);
  });
  res = res.toSet().toList();
  // print("Attr : $res");
  return res;
}
