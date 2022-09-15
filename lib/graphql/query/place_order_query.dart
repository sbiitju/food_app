class PlaceOrderQuery {
  String placeRegularOrder = """
  mutation placeRegularOrder(\$fingerprint: String!) {
  placeRegularOrder(
    fingerprint: \$fingerprint
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
