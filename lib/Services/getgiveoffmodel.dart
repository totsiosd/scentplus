// To parse this JSON data, do
//
//     final giveOff = giveOffFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<GiveOff> giveOffFromJson(String str) => List<GiveOff>.from(json.decode(str).map((x) => GiveOff.fromJson(x)));

String giveOffToJson(List<GiveOff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GiveOff {
    String aromadescr;
    String isactive;
    String messagedescr;
    String aromaid;

    GiveOff({
        this.aromadescr,
        this.isactive,
        this.messagedescr,
        this.aromaid,
    });

    factory GiveOff.fromJson(Map<String, dynamic> json) => GiveOff(
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


Future <List<String>> getAromaGiveOffIds(List<String> giveOffs, List<String> inAromaIds) async {
  String jsonString = await _loadGiveOffAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<GiveOff> records = jsonBody.map((f)=>GiveOff.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return ((giveOffs.indexOf(i.messagedescr)>=0) && (inAromaIds.indexOf(i.aromaid)>=0)) ; }).forEach((v){res.add(v.aromaid);});
  res=res.toSet().toList();  
  return res;
}


Future<String> _loadGiveOffAsset() async {
  return await rootBundle.loadString('assets/aromabygiveoff.json');
}

Future <List<String>> loadGiveOffList(List<String> aromataIds) async {
  String jsonString = await _loadGiveOffAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<GiveOff> records = jsonBody.map((f)=>GiveOff.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return (aromataIds.indexOf(i.aromaid)>=0) ; }).forEach((v){res.add(v.messagedescr);});
  res=res.toSet().toList();
  
  return res;
}
