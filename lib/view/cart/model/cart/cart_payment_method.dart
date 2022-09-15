class CartPaymentMethod {
  final String? id;
  final String? title;
  final String? type;
  final String? icon;

  CartPaymentMethod._({this.id, this.title, this.type, this.icon});

  factory CartPaymentMethod.parse(Map<String, dynamic> resultPaymentMethod) {
    return CartPaymentMethod._(
        id: resultPaymentMethod["id"],
        title: resultPaymentMethod["title"],
        type: resultPaymentMethod["type"],
        icon: resultPaymentMethod["icon"]);
  }
}
