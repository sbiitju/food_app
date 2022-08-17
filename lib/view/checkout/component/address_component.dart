import 'package:flutter/material.dart';
import 'package:food_app/view/checkout/model/order_place_address_model.dart';

class OrderAddressComponent extends StatelessWidget {
  final OrderPlaceAddress orderPlaceAddress;

  const OrderAddressComponent({required this.orderPlaceAddress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(orderPlaceAddress.receiverName),
    );
  }
}
