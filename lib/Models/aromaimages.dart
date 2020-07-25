// To parse this JSON data, do
//
//     final aromaimages = aromaimagesFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<Aromaimages> aromaimagesFromJson(String str) => List<Aromaimages>.from(
    json.decode(str).map((x) => Aromaimages.fromJson(x)));

String aromaimagesToJson(List<Aromaimages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aromaimages {
  Aromaimages({
    this.imagename,
    this.itemname,
    this.itemcode,
  });

  String imagename;
  String itemname;
  String itemcode;

  factory Aromaimages.fromJson(Map<String, dynamic> json) => Aromaimages(
        imagename: json["IMAGENAME"],
        itemname: json["ITEMNAME"],
        itemcode: json["ITEMCODE"],
      );

  Map<String, dynamic> toJson() => {
        "IMAGENAME": imagename,
        "ITEMNAME": itemname,
        "ITEMCODE": itemcode,
      };
}

Future<String> _loadImagesAsset() async {
  return await rootBundle.loadString('assets/aromaimages.json');
}

Future<String> getImagePath(String aromaId) async {
  String jsonString = await _loadImagesAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Aromaimages> records =
      jsonBody.map((f) => Aromaimages.fromJson(f)).toList();
  Aromaimages rec =
      records.firstWhere((element) => element.itemcode == aromaId);
  String res = rec.imagename;
  return res;
}
