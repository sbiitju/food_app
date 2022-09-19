import 'package:graphql_flutter/graphql_flutter.dart';

import 'cart_invoice.dart';
import 'cart_item.dart';
import 'cart_reciver.dart';

class Cart {
  final String? outletName;
  final String? restaurantName;
  final String? deliveryTime;
  final String? quantity;
  final List<CartItem>? listOfItems;
  final List<CartInvoice>? listOfInvoice;
  final CartReceiver? cartReceiver;
  final String? paymentMethodType;

  Cart(
      {this.outletName,
      this.restaurantName,
      this.deliveryTime,
      this.quantity,
      this.listOfItems,
      this.listOfInvoice,
      this.cartReceiver,
      this.paymentMethodType});

  factory Cart.parse(QueryResult result) {
    final resultCart = result.data!["getCart"]["result"]["cart"];
    return Cart(
        outletName: resultCart["outlet"]["name"],
        restaurantName: resultCart["outlet"]["restaurant"]["name"],
        deliveryTime:
            "${resultCart["outlet"]["deliveryTime"]}-${resultCart["outlet"]["deliveryTime"] + 5} mins",
        quantity: resultCart["outlet"]["restaurant"]["quantity"],
        listOfItems: (resultCart["items"] as List<dynamic>)
            .map((e) => CartItem.parse(e))
            .toList(),
        listOfInvoice: (resultCart["itemWisePaymentDetails"] as List<dynamic>)
            .map((e) => CartInvoice.parse(e))
            .toList(),
        cartReceiver: CartReceiver.parse(resultCart["receiver"]),
        paymentMethodType: resultCart["payment"]["type"]);
  }
}
