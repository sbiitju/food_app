import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:food_app/view/cart/model/cart/cart_payment_method.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/order_place_address_model.dart';

abstract class CartRepo {
  abstract Rx<Cart?> cart;

  Future<Cart> getCart();

  Future addToCart(CartItem itemInfo, LatLng latLng);

  Future<List<OrderPlaceAddress>> getCustomerShoppingCartAddress();

  Future<String> placeRegularOrder();

  Future<List<CartPaymentMethod>> getPaymentMethods();

  Future setPaymentMethod(String paymentType);

  Future setDeliveryAddress(String deliveryAddressId);

  Future removeItem(String objectId);

  Future subtractItem(String objectId);

  Future resetCart();
}
