import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Outlet {
  String? id;
  String? name;
  String? rating = 0.toString();
  String? deliveryFee;
  String? coverImages;
  String? logoImages;
  String? averageFoodPreparationTime;
  bool isFavourite;
  var listOfCusins = <String?>[];

  Outlet(
      this.id,
      this.name,
      this.deliveryFee,
      this.coverImages,
      this.logoImages,
      this.rating,
      this.listOfCusins,
      this.averageFoodPreparationTime,
      {this.isFavourite = false});
}

class OutletInfoModel {
  String? id;
  String? restaurantName;
  String? outletName;
  String? address;
  String? coverUrl;
  String? logoUrl;
  int? averageFoodPreparationTime;
  String? totalFavorite;
  String? estimatedDeliveryTime;
  var cuisines = <String?>[];
  bool? isFavorite;
  bool isOpen;
  String? deliveryFee;
  var rating;
  int? totalRating;

  OutletInfoModel(
      this.id,
      this.restaurantName,
      this.outletName,
      this.address,
      this.coverUrl,
      this.logoUrl,
      this.averageFoodPreparationTime,
      this.totalFavorite,
      this.estimatedDeliveryTime,
      this.cuisines,
      this.isFavorite,
      this.isOpen,
      this.deliveryFee,
      this.rating,
      this.totalRating);
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
      var listOfCusins = <String?>[];
      var listOfOutletTags = <String?>[];
      try {
        for (var i in e["cuisines"]) {
          listOfCusins.add(i["name"].toString());
        }
        outlet = Outlet(
            e["id"],
            e["restaurant"]["name"],
            e["deliveryFee"].toString(),
            e["meta"]["images"]["cover"].toString(),
            e["meta"]["images"]["logo"].toString(),
            e["rating"].toString(),
            listOfCusins,
            e["averageFoodPreparationTime"].toString());
      } catch (element) {
        outlet = null;
      }
      if (outlet != null) {
        resultOutlet.add(outlet);
      }
    }
    return resultOutlet;
  }

  List<CategoryItems> parseListOfCategoryItems() {
    final output =
        result.data!["getCategorizedItems"]["result"] as List<dynamic>;
    final listOfCategoryItems = <CategoryItems>[];
    for (final category in output) {
      final items = <ItemInfo>[];
      for (final item in (category["items"] as List<dynamic>)) {
        items.add(
            ItemInfo(
                item["basePrice"].toDouble(),
                item["meta"]["id"],
                item["meta"]["name"],
                item["meta"]["description"],
                item["meta"]["images"]
            )
        );
      }
      listOfCategoryItems.add(
          CategoryItems(
              category["id"],
              category["name"],
              items
          )
      );
    }

    return listOfCategoryItems;
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

  OutletInfoModel parseOutletInfoResult() {
    var cuisines = <String?>[];
    var output = result.data!["getOutlet"]["result"];
    String id = output["id"].toString();
    String restaurantName = output["restaurant"]["name"].toString();
    String outletName = output["meta"]["name"].toString();
    String address = output["meta"]["address"].toString();
    String coverUrl = output["meta"]["images"]["cover"].toString();
    String logoUrl = output["meta"]["images"]["logo"].toString();
    int averageFoodPreparationTime = output["averageFoodPreparationTime"];
    String totalFavorite = output["totalFavorite"].toString();
    String? estimatedDeliveryTime = output["estimatedDeliveryTime"].toString();
    for (var i in output["cuisines"]) {
      cuisines.add(i["name"].toString());
    }
    bool isFavorite = output["isFavorite"];
    bool isOpen = output["isOpen"];
    String deliveryFee = output["deliveryFee"].toString();
    var rating = output["rating"];
    int totalRating = output["totalRating"];
    return OutletInfoModel(
        id,
        restaurantName,
        outletName,
        address,
        coverUrl,
        logoUrl,
        averageFoodPreparationTime,
        totalFavorite,
        estimatedDeliveryTime,
        cuisines,
        isFavorite,
        isOpen,
        deliveryFee,
        rating,
        totalRating);
  }

  bool parseGetZone() {
    var output = result.data!["getZone"]["result"];
    return output["isActive"];
  }
}

class CategoryItems {
  String? id;
  String? name;
  var items = <ItemInfo>[];

  CategoryItems(this.id, this.name, this.items);
}

class ItemInfo {
  double basePrice;
  String? itemId;
  String? itemName;
  String? itemDescription;
  String? itemImage;

  ItemInfo(this.basePrice, this.itemId, this.itemName, this.itemDescription,
      this.itemImage);
}
