import 'package:graphql_flutter/graphql_flutter.dart';

class Outlet {
  String? id;
  String? name;
  String? rating=0.toString();
  String? deliveryFee;
  String? coverImages;
  String? logoImages;
  String? averageFoodPreparationTime;
  bool isFavourite;
  var listOfCusins=<String?>[];
  Outlet(this.id, this.name, this.deliveryFee, this.coverImages,this.logoImages,this.rating,this.listOfCusins,this.averageFoodPreparationTime,{this.isFavourite =false});

}

class Area {
  final areaName;
  final cityName;
  final districtName;
  final houseName;
  final roadName;

  Area(this.areaName, this.cityName, this.districtName, this.houseName,
      this.roadName);
}

class ParseHpOutletListResponse {
  final QueryResult result;

  ParseHpOutletListResponse(this.result);

  List<Outlet> parse() {
    final List<Outlet> resultOutlet = <Outlet>[];
    final list =
        result.data!["getHPOutletList"]["result"]["outlets"] as List<dynamic>;
    for (var e in list) {
      Outlet? outlet;
      var listOfCusins=<String?>[];
      var listOfOutletTags=<String?>[];
      try {
        for(var i in e["cuisines"]){
          listOfCusins.add(i["name"].toString());
        }
        outlet = Outlet(e["id"], e["restaurant"]["name"],e["deliveryFee"].toString(),e["meta"]["images"]["cover"].toString(),e["meta"]["images"]["logo"].toString(),e["rating"].toString(),listOfCusins,e["averageFoodPreparationTime"].toString());
      } catch (element) {
        outlet = null;
      }
      if (outlet != null) {
        resultOutlet.add(outlet);
      }
    }
    return resultOutlet;
  }

  Area parseReverseGeoCodeResult() {
    var output = result.data!["reverseGeoCode"]["result"];
    var address = output["address"].toString();
    var area = output["area"].toString();
    var city = output["city"].toString();
    var district = output["district"].toString();
    var a = Area(area, city, district, address, "");
    return a;
  }

  bool parseGetZone() {
    var output = result.data!["getZone"]["result"];
    return output["isActive"];
  }
}
