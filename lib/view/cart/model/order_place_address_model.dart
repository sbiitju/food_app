import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../cart/model/delivery_address_model.dart';

class OrderPlaceAddress {
  final String tagName;
  final String receiverName;
  final String receiverNumber;
  final String address;
  LatLng latLng = const LatLng(23.7925, 90.4078);
  var isSelected = false;

  OrderPlaceAddress(this.tagName, this.receiverName, this.receiverNumber,
      this.address, this.latLng, this.isSelected);
}

class ParseOrderPlaceAddress {
  static DeliveryAddress parseOrderPlaceAddress() {
    return DeliveryAddress(
        "Md. Shahin Bashar", "+8801613162522", LatLng(23.7925, 90.4078), "");
  }
}
