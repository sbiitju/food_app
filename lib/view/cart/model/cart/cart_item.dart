class CartItem {
  final String itemName;
  final int itemCount;
  final double price;

  CartItem(
      {required this.itemName, required this.itemCount, required this.price});

  factory CartItem.parse(Map<String, dynamic> result) {
    return CartItem(
        itemName: result["meta"]["name"],
        itemCount: result["quantity"],
        price: result["price"].toDouble());
  }
}
