class CartInvoice {
  final String title;
  final String colorCode;
  final String amount;

  CartInvoice(
      {required this.title, required this.colorCode, required this.amount});

  factory CartInvoice.parse(Map<String, dynamic> result) {
    return CartInvoice(
        title: result["title"],
        colorCode: result["colorCode"],
        amount: result["value"]);
  }
}
