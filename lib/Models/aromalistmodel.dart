// To parse this JSON data, do
//
//     final aromaList = aromaListFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<AromaList> aromaListFromJson(String str) => List<AromaList>.from(json.decode(str).map((x) => AromaList.fromJson(x)));

String aromaListToJson(List<AromaList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AromaList {
    String id;
    String title;
    String intense;

    AromaList({
        this.id,
        this.title,
        this.intense,
    });

    factory AromaList.fromJson(Map<String, dynamic> json) => AromaList(
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

Future <List<AromaList>> getAromas(List<String> inAromaIds) async {
  String jsonString = await _loadAromaAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<AromaList> records = jsonBody.map((f)=>AromaList.fromJson(f)).toList();
  List<AromaList> res = [];
  records.where((i){ return ( (inAromaIds.indexOf(i.id)>=0)) ; }).forEach((v){res.add(v);});
  res=res.toSet().toList();  
  return res;
}


Future<String> _loadAromaAsset() async {
  return await rootBundle.loadString('assets/aromata.json');
}
