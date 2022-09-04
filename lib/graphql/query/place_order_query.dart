class PlaceOrderQuery {
  String placeRegularOrder = """
  mutation placeRegularOrder(\$coordinate: Point!) {
  placeRegularOrder(
    fingerprint: "string"
    currentLocation:\$coordinate,
  ) {
    message
    statusCode
    result {
      orderUid
      status
    }
  }
}
  """;
}
