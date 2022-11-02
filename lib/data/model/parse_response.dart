import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'area_model.dart';
import 'category_items_model.dart';
import 'outlet_info_model.dart';
import 'outlet_model.dart';

class ParseResponse {
  final QueryResult result;

  ParseResponse(this.result);

  List<Outlet> parse() {
    final List<Outlet> resultOutlet = <Outlet>[];
    final list =
        result.data!["getHPOutletList"]["result"]["outlets"] as List<dynamic>;
    for (var e in list) {
      Outlet? outlet;
      var listOfCusins = <String?>[];
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
      final items = <CartItem>[];
      final List<Variant> variants = [];
      for (final item in (category["items"] as List<dynamic>)) {
        for (final variant in item["variants"] as List<dynamic>) {
          variants.add(
              Variant(variant["id"], variant["name"], variant["price"] ?? 0.0));
        }
        items.add(CartItem(
          itemId: item["id"] ?? "",
          itemName: item["meta"]["name"],
          price: item["basePrice"].toDouble(),
          thumbnail: item["meta"]["image"] ?? "",
          description: item["meta"]["description"] ?? "",
          variants: variants,
        ));
      }
      listOfCategoryItems
          .add(CategoryItems(category["id"], category["name"], items));
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
