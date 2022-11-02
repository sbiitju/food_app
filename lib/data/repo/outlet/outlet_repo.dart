import 'package:food_app/view/cart/model/cart/cart_item.dart';

abstract class OutletRepo {
  Future removeItem(CartItem cartItem);

  Future subtractItem(CartItem cartItem);

  Future resetCart();
}
