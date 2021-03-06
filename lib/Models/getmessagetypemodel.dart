// To parse this JSON data, do
//
//     final messageType = messageTypeFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:perfumepicker/Utils/constants.dart';

List<MessageType> messageTypeFromJson(String str) => List<MessageType>.from(
    json.decode(str).map((x) => MessageType.fromJson(x)));

String messageTypeToJson(List<MessageType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageType {
  MessageType({
    this.aromadescr,
    this.isactive,
    this.messagedescr,
    this.messagedescrEn,
    this.categoryRootEn,
    this.id,
    this.categoryRoot,
    this.aromaId,
  });

  String aromadescr;
  String isactive;
  String messagedescr;
  String messagedescrEn;
  String categoryRootEn;
  String id;
  String categoryRoot;
  String aromaId;

  factory MessageType.fromJson(Map<String, dynamic> json) => MessageType(
        aromadescr: json["AROMADESCR"],
        isactive: json["ISACTIVE"],
        messagedescr: json["MESSAGEDESCR"],
        messagedescrEn: json["MESSAGEDESCR_EN"],
        categoryRootEn: json["CategoryRoot_En"],
        id: json["id"],
        categoryRoot: json["CategoryRoot"],
        aromaId: json["AromaID"],
      );

  Map<String, dynamic> toJson() => {
        "AROMADESCR": aromadescr,
        "ISACTIVE": isactive,
        "MESSAGEDESCR": messagedescr,
        "MESSAGEDESCR_EN": messagedescrEn,
        "CategoryRoot_En": categoryRootEn,
        "id": id,
        "CategoryRoot": categoryRoot,
        "AromaID": aromaId,
      };
}

Future<List<String>> getAromaMessageTypeIds(
    Locale locale, List<String> messageTypes, List<String> inAromaIds) async {
  String jsonString = await _loadMessageTypeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<MessageType> records =
      jsonBody.map((f) => MessageType.fromJson(f)).toList();
  List<String> res = [];
  records.where((i) {
    String element = locale.languageCode == GREEKLANGUAGECODE
        ? i.messagedescr
        : i.messagedescrEn;
    return ((messageTypes.indexOf(element) >= 0) &&
        (i.isactive == "1") &&
        (inAromaIds.indexOf(i.aromaId) >= 0));
  }).forEach((v) {
    res.add(v.aromaId);
  });
  res = res.toSet().toList();
  return res;
}

Future<String> _loadMessageTypeAsset() async {
  return await rootBundle.loadString('assets/messagedetails.json');
}

Future<List<String>> loadMessageTypeList(
    Locale locale, List<String> aromataIds) async {
  String jsonString = await _loadMessageTypeAsset();
  Iterable jsonBody = json.decode(jsonString);
  List<MessageType> records =
      jsonBody.map((f) => MessageType.fromJson(f)).toList();
  List<String> res = [];
  records.where((i) {
    return (aromataIds.indexOf(i.aromaId) >= 0);
  }).forEach((v) {
    if ((v.categoryRootEn == "MessageType") && (v.isactive == "1"))
      res.add(locale.languageCode == GREEKLANGUAGECODE
          ? v.messagedescr
          : v.messagedescrEn);
  });
  res = res.toSet().toList();

  return res;
}
