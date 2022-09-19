import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/cart/cart_payment_method.dart';
import '../../../view/cart/model/order_place_address_model.dart';
import '../../model/item.dart';

abstract class CartDataSource {
  Future<Cart> getCart(String fingerPrint);

  Future addToCart(Item itemInfo, LatLng latLng, String fingerPrint);

  Future getCustomerShoppingCartReceivingAddresses();

  Future<List<OrderPlaceAddress>> getCustomerShoppingCartAddress();

  Future<String> placeRegularOrder(String fingerPrint);

  Future<List<CartPaymentMethod>> getPaymentMethods(double lat, double lon);

  Future setPaymentMethod(String fingerPrint, String paymentType);
}
