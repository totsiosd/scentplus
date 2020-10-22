// To parse this JSON data, do
//
//     final aromaimages = aromaimagesFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<Aromaimage> aromaimageFromJson(String str) =>
    List<Aromaimage>.from(json.decode(str).map((x) => Aromaimage.fromJson(x)));

String aromaimageToJson(List<Aromaimage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aromaimage {
  Aromaimage({
    this.id,
    this.title,
    this.imagename,
  });

  String id;
  String title;
  String imagename;

  factory Aromaimage.fromJson(Map<String, dynamic> json) => Aromaimage(
        id: json["ID"],
        title: json["Title"],
        imagename: json["IMAGENAME"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Title": title,
        "IMAGENAME": imagename,
      };
}

Future<String> _loadImagesAsset() async {
  return await rootBundle.loadString('assets/aromaimages.json');
}

Future<String> getImagePath(String aromaId) async {
  String jsonString = await _loadImagesAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Aromaimage> records =
      jsonBody.map((f) => Aromaimage.fromJson(f)).toList();
  Aromaimage rec = records.firstWhere((element) => element.id == aromaId);
  String res = rec.imagename;
  return res;
}
