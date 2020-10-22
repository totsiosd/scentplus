import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

List<Place> placeFromJson(String str) =>
    List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));
String placeToJson(List<Place> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
  Place({
    this.id,
    this.companyTypeEn,
    this.companyType,
  });

  String id;
  String companyTypeEn;
  String companyType;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["ID"],
        companyTypeEn: json["CompanyTypeEN"],
        companyType: json["CompanyType"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CompanyTypeEN": companyTypeEn,
        "CompanyType": companyType,
      };
}

const String JSONFILE = 'assets/companytype.json';

Future<String> _loadPlacesAsset() async {
  return await rootBundle.loadString(JSONFILE);
}

Future<List<String>> loadPlaces(Locale locale) async {
  String jsonString = await _loadPlacesAsset();
  //final jsonResponse = json.decode(jsonString);
  //Iterable jsonBody = json.decode(jsonString);
  List<Place> places = placeFromJson(jsonString);
  //jsonBody.map((f) => Place.fromJson(f)).toList();
  List<String> res = [];

  places.forEach((f) =>
      res.add(locale.languageCode == 'el' ? f.companyType : f.companyTypeEn));
  res = res.toSet().toList();

  return res;
}

Future<String> _getPlacesAsset() async {
  return await rootBundle.loadString(JSONFILE, cache: false);
}

Future<String> getPlaceID(Locale locale, String searchPlace) async {
  String jsonString = await _getPlacesAsset();
  //final jsonResponse = json.decode(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<Place> places = jsonBody.map((f) => Place.fromJson(f)).toList();
  // String res =places.firstWhere((v) => v.companyType==searchPlace ).id;

  return places.firstWhere((v) {
    bool found;
    if (locale.languageCode == 'el')
      found = (v.companyType == searchPlace);
    else
      found = v.companyTypeEn == searchPlace;
    return found;
  }).id;
}
