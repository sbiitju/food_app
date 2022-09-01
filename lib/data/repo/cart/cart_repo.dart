import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../model/cart/cart.dart';

abstract class CartRepo {
  abstract Rx<Cart?> cart;

  abstract Rx<int> totalItem;
  abstract Rx<double> totalAmount;

  Future<Cart> getCart();

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future getPaymentMethods(double lat, double lon);
}
