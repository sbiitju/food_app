class Item {
  final String id;
  final String itemName;
  final double basePrice;
  final String thumbnail;
  final String description;
  final List<Variant>? variants;
  int? quantity;

  Item(this.id, this.itemName, this.basePrice, this.thumbnail, this.description,
      this.variants,
      {this.quantity});
}

class Variant {
  final String variantId;
  final String variantName;
  final double variantPrice;
  int? quantity;

  Variant(this.variantId, this.variantName, this.variantPrice, {this.quantity});
}
