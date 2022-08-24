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
