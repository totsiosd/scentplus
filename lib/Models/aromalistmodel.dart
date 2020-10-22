// To parse this JSON data, do
//
//     final aromaList = aromaListFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<Aroma> aromaListFromJson(String str) =>
    List<Aroma>.from(json.decode(str).map((x) => Aroma.fromJson(x)));

String aromaListToJson(List<Aroma> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aroma {
  String id;
  String title;
  String intense;

  Aroma({
    this.id,
    this.title,
    this.intense,
  });

  factory Aroma.fromJson(Map<String, dynamic> json) => Aroma(
        id: json["ID"],
        title: json["Title"],
        intense: json["Intense"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Title": title,
        "Intense": intense,
      };
}

Future<List<Aroma>> getAromas(List<String> inAromaIds) async {
  String jsonString = await _loadAromaAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Aroma> records = jsonBody.map((f) => Aroma.fromJson(f)).toList();
  List<Aroma> res = [];
  records.where((i) {
    return ((inAromaIds.indexOf(i.id) >= 0));
  }).forEach((v) {
    res.add(v);
  });
  res = res.toSet().toList();
  print(res);
  return res;
}

Future<String> _loadAromaAsset() async {
  return await rootBundle.loadString('assets/aromata.json');
}
