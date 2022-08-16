import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryAddress {
  final String name;
  final String number;
  LatLng latLng = const LatLng(23.7925, 90.4078);
  final String address;

  DeliveryAddress(this.name, this.number, this.latLng, this.address);
}
