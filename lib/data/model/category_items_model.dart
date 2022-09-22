import 'package:food_app/view/cart/model/cart/cart_item.dart';

class CategoryItems {
  String? id;
  String? name;
  var items = <CartItem>[];

  CategoryItems(this.id, this.name, this.items);
}
