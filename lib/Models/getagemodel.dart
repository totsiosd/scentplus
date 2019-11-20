// To parse this JSON data, do
//
//     final age = ageFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<Age> ageFromJson(String str) => List<Age>.from(json.decode(str).map((x) => Age.fromJson(x)));

String ageToJson(List<Age> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Age {
    String aromadescr;
    String isactive;
    String messagedescr;
    String aromaid;

    Age({
        this.aromadescr,
        this.isactive,
        this.messagedescr,
        this.aromaid,
    });

    factory Age.fromJson(Map<String, dynamic> json) => Age(
        aromadescr: json["AROMADESCR"],
        isactive: json["ISACTIVE"],
        messagedescr: json["MESSAGEDESCR"],
        aromaid: json["AROMAID"],
    );

    Map<String, dynamic> toJson() => {
        "AROMADESCR": aromadescr,
        "ISACTIVE": isactive,
        "MESSAGEDESCR": messagedescr,
        "AROMAID": aromaid,
    };
}

Future <List<String>> getAromaAgeIds(List<String> ages, List<String> inAromaIds) async {
  String jsonString = await _loadAgeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Age> records = jsonBody.map((f)=>Age.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return ((ages.indexOf(i.messagedescr)>=0) && (inAromaIds.indexOf(i.aromaid)>=0)) ; }).forEach((v){res.add(v.aromaid);});
  res=res.toSet().toList();
  
  return res;
}


Future<String> _loadAgeAsset() async {
  return await rootBundle.loadString('assets/aromabyage.json');
}

Future <List<String>> loadAgeList(List<String> aromataIds) async {
  String jsonString = await _loadAgeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Age> records = jsonBody.map((f)=>Age.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return (aromataIds.indexOf(i.aromaid)>=0) ; }).forEach((v){res.add(v.messagedescr);});
  res=res.toSet().toList();
  
  return res;
}
