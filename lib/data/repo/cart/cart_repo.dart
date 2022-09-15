import 'package:food_app/view/cart/model/cart/cart_payment_method.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/delivery_address_model.dart';
import '../../model/item.dart';

abstract class CartRepo {
  abstract Rx<Cart?> cart;

  Future<Cart> getCart();

  Future addToCart(Item itemInfo, LatLng latLng);

  Future getCustomerShoppingCartReceivingAddresses();

  Future<DeliveryAddress> getCustomerShoppingCartAddress();

  Future<String> placeRegularOrder();

  Future<List<CartPaymentMethod>> getPaymentMethods();

  Future setPaymentMethod(String paymentType);
}
