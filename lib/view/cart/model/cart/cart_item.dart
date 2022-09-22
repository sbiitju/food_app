class CartItem {
  final String itemId;
  final String itemName;
  final int itemCount;
  final double price;
  final String thumbnail;
  final String description;
  Variant? variant;
  List<Variant>? variants;
  int? quantity;

  CartItem(
      {required this.itemId,
      required this.itemName,
      required this.itemCount,
      required this.thumbnail,
      required this.description,
      this.variant,
      this.variants,
      required this.price,
      this.quantity});

  factory CartItem.parse(Map<String, dynamic> result) {
    return CartItem(
        itemId: result["id"],
        itemName: result["meta"]["name"],
        itemCount: result["quantity"],
        price: result["price"].toDouble(),
        variant: Variant(result["variant"]["id"], result["variant"]["name"],
            result["variant"]["additionalPrice"].toDouble()),
        description: "",
        thumbnail: "",
        quantity: result["quantity"]);
  }
}

class Variant {
  final String variantId;
  final String variantName;
  final double variantPrice;
  double? quantity;

  Variant(this.variantId, this.variantName, this.variantPrice, {this.quantity});
}
