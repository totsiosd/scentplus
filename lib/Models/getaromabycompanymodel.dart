import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

 class AromataByCompany {
  String id;
  String companyId;
  String companyType;
  String enabled;
  String aromaId;

  AromataByCompany({
    this.id,
    this.companyId,
    this.companyType,
    this.enabled,
    this.aromaId
  });
  factory AromataByCompany.fromJson(Map<String, dynamic> parsedJson) {
    return AromataByCompany(
      id: parsedJson['ID'],
      companyId: parsedJson['COMPANYID'],
      companyType: parsedJson['COMPANYTYPE'],
      enabled: parsedJson['ENABLED'],      
      aromaId: parsedJson['AROMAID'],
    );
  }
}

Future<String> _loadAromataAsset() async {
  return await rootBundle.loadString('assets/aromabycompany.json');
}

Future <List<String>> loadAromata(String companyType) async {
  String jsonString = await _loadAromataAsset();
  //final jsonResponse = json.decode(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<AromataByCompany> aromata = jsonBody.map((f)=>AromataByCompany.fromJson(f)).toList();
  List<String> res = [];
   aromata.where((i){ return (i.companyType==companyType) && (i.enabled=="1");
   }).forEach((v){res.add(v.aromaId);});
   res=res.toSet().toList();
 
  return res;
}


/*	{
		"ID": "4026",
		"COMPANYID": "1",
		"COMPANYTYPE": "Auto - Moto",
		"ENABLED": "1",
		"AROMAID": "1"
	},
  */
