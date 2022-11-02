import '../../../view/cart/model/cart/cart_item.dart';

abstract class OutletDataSource {
  Future removeItem(String fingerPrint, CartItem cartItem);

  Future subtractItem(String fingerPrint, CartItem cartItem);

  Future resetCart();
}
