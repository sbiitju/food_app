class GetCart {
  String getCart = """
  query getCart(\$fingerprint: String!){
  getCart(fingerprint: \$fingerprint) {
    message
    statusCode
    result {
      fingerprint
      isSync
      cart{
         payment{
          deliveryCharge
          finalTotal
          itemSubtotal
        }
        outlet{
          id
          name
          restaurant{
            name
          }
        }
      }
    }
  }
}
  """;
}
