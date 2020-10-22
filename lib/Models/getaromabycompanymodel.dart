import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:perfumepicker/Utils/constants.dart';

List<AromataByCompany> aromataByCompanyFromJson(String str) =>
    List<AromataByCompany>.from(
        json.decode(str).map((x) => AromataByCompany.fromJson(x)));

String aromataByCompanyToJson(List<AromataByCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AromataByCompany {
  AromataByCompany({
    this.companyTypeId,
    this.companyTypeEn,
    this.companyType,
    this.enabled,
    this.aromaid,
  });

  String companyTypeId;
  String companyTypeEn;
  String companyType;
  String enabled;
  String aromaid;

  factory AromataByCompany.fromJson(Map<String, dynamic> json) =>
      AromataByCompany(
        companyTypeId: json["CompanyTypeID"],
        companyTypeEn: json["CompanyTypeEN"],
        companyType: json["CompanyType"],
        enabled: json["enabled"],
        aromaid: json["AROMAID"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyTypeID": companyTypeId,
        "CompanyTypeEN": companyTypeEn,
        "CompanyType": companyType,
        "enabled": enabled,
        "AROMAID": aromaid,
      };
}

Future<String> _loadAromataAsset() async {
  return await rootBundle.loadString('assets/aromabycompany.json');
}

Future<List<String>> loadAromata(Locale locale, String companyType) async {
  String jsonString = await _loadAromataAsset();
  //final jsonResponse = json.decode(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<AromataByCompany> aromata =
      jsonBody.map((f) => AromataByCompany.fromJson(f)).toList();
  List<String> res = [];
  aromata.where((i) {
    String element = locale.languageCode == GREEKLANGUAGECODE
        ? i.companyType
        : i.companyTypeEn;
    return (element == companyType) && (i.enabled == "1");
  }).forEach((v) {
    res.add(v.aromaid);
  });
  res = res.toSet().toList();

  return res;
}
