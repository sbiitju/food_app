import '../../model/cart/cart.dart';

abstract class CartDataSource {
  Future<Cart> getCart(String fingerPrint);

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future getPaymentMethods(double lat, double lon);
}
