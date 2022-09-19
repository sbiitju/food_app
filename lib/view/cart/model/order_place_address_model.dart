import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderPlaceAddress {
  final String? addressid;
  final String? tagName;
  final String? receiverName;
  final String? receiverNumber;
  final String? address;
  LatLng? latLng = const LatLng(23.7925, 90.4078);
  bool? isSelected = false;

  OrderPlaceAddress._(
      {this.addressid,
      this.tagName,
      this.receiverName,
      this.receiverNumber,
      this.address,
      this.latLng,
      this.isSelected});

  factory OrderPlaceAddress.parse(Map<String, dynamic> resultAddress) {
    return OrderPlaceAddress._(
      addressid: resultAddress["id"],
      address: resultAddress["address"],
      tagName: resultAddress["addressType"],
      receiverName: resultAddress["receiverName"],
      receiverNumber: resultAddress["countryCode"] + resultAddress["phone"],
      isSelected: resultAddress["isSelected"],
      latLng: LatLng(resultAddress["location"]["coordinates"][0],
          resultAddress["location"]["coordinates"][1]),
    );
  }
}
