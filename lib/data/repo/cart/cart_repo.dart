import '../../model/cart/cart.dart';

abstract class CartRepo {
  Future<Cart> getCart();

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future getPaymentMethods(double lat, double lon);
}
