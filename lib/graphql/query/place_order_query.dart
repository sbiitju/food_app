class PlaceOrderQuery {
  String placeRegularOrder = """
  mutation {
  placeRegularOrder(
    fingerprint: "string"
    currentLocation:{
        type: Point,
        coordinates: [90, 23]
    },
    vendor: "string"
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
