import '../../../view/cart/model/delivery_address_model.dart';
import '../../../view/cart/model/payment_ui_model.dart';
import '../../model/cart/cart.dart';

abstract class CartDataSource {
  Future<Cart> getCart(String fingerPrint);

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future<DeliveryAddress> getCustomerShoppingCartAddress();

  Future<List<PaymentUiModel>> getPaymentMethod(double lat, double lon);

  Future<String> placeRegularOrder(double lat, double lon, String fingerPrint);
}
