import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/delivery_address_model.dart';
import '../../../view/cart/model/payment_ui_model.dart';
import '../../model/item.dart';

abstract class CartDataSource {
  Future<Cart> getCart(String fingerPrint);

  Future addToCart(Item itemInfo, LatLng latLng);

  Future getCustomerShoppingCartReceivingAddresses();

  Future<DeliveryAddress> getCustomerShoppingCartAddress();

  Future<List<PaymentUiModel>> getPaymentMethod(double lat, double lon);

  Future<String> placeRegularOrder(double lat, double lon, String fingerPrint);
}
