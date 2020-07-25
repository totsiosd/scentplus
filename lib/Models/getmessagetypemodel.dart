// To parse this JSON data, do
//
//     final messageType = messageTypeFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List<MessageType> messageTypeFromJson(String str) => List<MessageType>.from(json.decode(str).map((x) => MessageType.fromJson(x)));

String messageTypeToJson(List<MessageType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageType {
    String aromadescr;
    String isactive;
    String messagedescr;
    String aromaid;

    MessageType({
        this.aromadescr,
        this.isactive,
        this.messagedescr,
        this.aromaid,
    });

    factory MessageType.fromJson(Map<String, dynamic> json) => MessageType(
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



Future <List<String>> getAromaMessageTypeIds(List<String> messageTypes, List<String> inAromaIds) async {
  String jsonString = await _loadMessageTypeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<MessageType> records = jsonBody.map((f)=>MessageType.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return ((messageTypes.indexOf(i.messagedescr)>=0) && (inAromaIds.indexOf(i.aromaid)>=0)) ; }).forEach((v){res.add(v.aromaid);});
  res=res.toSet().toList();  
  return res;
}


Future<String> _loadMessageTypeAsset() async {
  return await rootBundle.loadString('assets/aromabymessagetype.json');
}

Future <List<String>> loadMessageTypeList(List<String> aromataIds) async {
  String jsonString = await _loadMessageTypeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<MessageType> records = jsonBody.map((f)=>MessageType.fromJson(f)).toList();
  List<String> res = [];
  records.where((i){ return (aromataIds.indexOf(i.aromaid)>=0) ; }).forEach((v){res.add(v.messagedescr);});
  res=res.toSet().toList();
  
  return res;
}
