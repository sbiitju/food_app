import 'Invoice.dart';
import 'Item.dart';

class Cart {
  final String outletName;
  final String restaurantName;
  final String deliveryTime;
  final List<CartItem> listOfItems;
  final List<CartInvoice> listOfInvoice;

  Cart(this.outletName, this.restaurantName, this.deliveryTime,
      this.listOfItems, this.listOfInvoice);
}

class CartParse {
  static Cart parseGetCart() {
    return Cart("outletName", "restaurantName", "25 - 30 mins", [
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
      CartItem("itemName", 3, 100),
    ], [
      CartInvoice("title", "colorCode", 200),
      CartInvoice("title", "colorCode", 200),
      CartInvoice("title", "colorCode", 200),
      CartInvoice("title", "colorCode", 200),
      CartInvoice("title", "colorCode", 200),
      CartInvoice("title", "colorCode", 200),
      CartInvoice("Last title", "colorCode", 500),
    ]);
  }
}
