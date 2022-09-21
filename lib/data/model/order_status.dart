class OrderStatus {
  final String? orderUid;
  final String? restaurantName;
  final String? currentState;
  final String? stateSummary;

  OrderStatus._(
      {this.orderUid,
      this.restaurantName,
      this.currentState,
      this.stateSummary});

  factory OrderStatus.parse(Map<String, dynamic> orderResult) {
    return OrderStatus._(
        restaurantName: orderResult["restaurantName"],
        orderUid: orderResult["orderUid"],
        currentState: orderResult["currentState"],
        stateSummary: orderResult["stateSummary"]);
  }
}
