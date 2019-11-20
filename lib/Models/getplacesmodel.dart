import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

 class Place {
  String id;
  String companyId;
  String companyType;
  String enabled;
  String aromaId;

  Place({
        this.id,
    this.companyId,
    this.companyType,
    this.enabled,
    this.aromaId
  });
  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
      id: parsedJson['ID'],
      companyId: parsedJson['COMPANYID'],
      companyType: parsedJson['COMPANYTYPE'],
      enabled: parsedJson['ENABLED'],      
      aromaId: parsedJson['AROMAID'],
    );
  }
}

Future<String> _loadPlacesAsset() async {
  return await rootBundle.loadString('assets/companytype.json');
}

Future <List<String>> loadPlaces() async {
  String jsonString = await _loadPlacesAsset();
  //final jsonResponse = json.decode(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<Place> places = jsonBody.map((f)=>Place.fromJson(f)).toList();
  List<String> res = [];
   places.forEach((f)=>res.add( f.companyType));
   res=res.toSet().toList();
  
  return res;
}


Future<String> _getPlacesAsset() async {
  return await rootBundle.loadString('assets/companytype.json', cache: false);
}

Future<String> getPlaceID(String searchPlace) async {
  String jsonString = await _getPlacesAsset();
  //final jsonResponse = json.decode(jsonString);
  Iterable jsonBody = json.decode(jsonString);
  List<Place> places = jsonBody.map((f)=>Place.fromJson(f)).toList();
 // String res =places.firstWhere((v) => v.companyType==searchPlace ).id;
  
  return   places.firstWhere((v) => v.companyType==searchPlace ).id;
}

/*	{
		"ID": "4026",
		"COMPANYID": "1",
		"COMPANYTYPE": "Auto - Moto",
		"ENABLED": "1",
		"AROMAID": "1"
	},
  */
