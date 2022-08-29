class GetCart {
  String getCart = """
  query getCart(\$fingerprint: fingerprint){
  getCart(fingerprint: \$fingerprint) {
    message
    statusCode
    result {
      fingerprint
      isSync
      cart{
        orderFoodNote
      }
    }
  }
}
  """;
}
