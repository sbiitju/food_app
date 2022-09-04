import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../view/cart/model/delivery_address_model.dart';
import '../../../view/cart/model/payment_ui_model.dart';
import '../../model/cart/cart.dart';

abstract class CartRepo {
  abstract Rx<Cart?> cart;

  abstract Rx<int> totalItem;
  abstract Rx<double> totalAmount;

  Future<Cart> getCart();

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future<DeliveryAddress> getCustomerShoppingCartAddress();

  Future<List<PaymentUiModel>> getPaymentMethod(double lat, double lon);

  Future<String> placeRegularOrder(double lat, double lon, String fingerPrint);
}
