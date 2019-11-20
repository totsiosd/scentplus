// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<Gender> genderFromJson(String str) => List<Gender>.from(json.decode(str).map((x) => Gender.fromJson(x)));

String genderToJson(List<Gender> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gender {
    String aromadescr;
    String attr;
    String aromaid;

    Gender({
        this.aromadescr,
        this.attr,
        this.aromaid,
    });

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        aromadescr: json["AROMADESCR"],
        attr: json["ATTR"],
        aromaid: json["AROMAID"],
    );

    Map<String, dynamic> toJson() => {
        "AROMADESCR": aromadescr,
        "ATTR": attr,
        "AROMAID": aromaid,
    };
}

Future<String> _loadGenderAsset() async {
  return await rootBundle.loadString('assets/aromabygender.json');
}

Future <List<String>> loadGenderList(List<String> aromataIds) async {
  String jsonString = await _loadGenderAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = jsonBody.map((f)=>Gender.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return (aromataIds.indexOf(i.aromaid)>=0) ; }).forEach((v){res.add(v.attr);});
  res=res.toSet().toList();
  
  return res;
}

Future <List<String>> getAromaGenderIds(List<String> genders, List<String> inAromaIds) async {
  String jsonString = await _loadGenderAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = jsonBody.map((f)=>Gender.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return ((genders.indexOf(i.attr)>=0) && (inAromaIds.indexOf(i.aromaid)>=0)) ; }).forEach((v){res.add(v.aromaid);});
  res=res.toSet().toList();
  
  return res;
}

 

Future <List<String>> getGenders() async {
  String jsonString = await _loadGenderAsset();
  print(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<Gender> records = jsonBody.map((f)=>Gender.fromJson(f)).toList();
  List<String> res = [];
  records.forEach((v){res.add(v.attr);});
  res=res.toSet().toList();
  print("Attr : $res");
  return res;
}