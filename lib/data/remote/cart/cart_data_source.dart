abstract class CartDataSource {
  Future getCart(String fingerPrint);

  Future addToCart();

  Future getCustomerShoppingCartReceivingAddresses();

  Future getPaymentMethods(double lat, double lon);
}
