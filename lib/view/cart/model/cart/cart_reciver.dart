import 'package:google_maps_flutter/google_maps_flutter.dart';

class CartReceiver {
  final String? id;
  final String? receiverName;
  final String? receiverAddress;
  final String? receiverPhone;
  final String? receiverCountryCode;
  final LatLng? latLang;

  CartReceiver._(
      {this.id,
      this.receiverName,
      this.receiverAddress,
      this.receiverPhone,
      this.receiverCountryCode,
      this.latLang});

  factory CartReceiver.parse(Map<String, dynamic> resultReceiver) {
    return CartReceiver._(
        id: resultReceiver["id"],
        receiverName: resultReceiver["receiverName"],
        receiverAddress: resultReceiver["address"],
        receiverPhone: resultReceiver["phone"],
        receiverCountryCode: resultReceiver["countryCode"],
        latLang: LatLng(resultReceiver["location"]["coordinates"][1].toDouble(),
            resultReceiver["location"]["coordinates"][0].toDouble()));
  }
}
