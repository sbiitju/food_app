class GetPaymentQuery {
  String getPaymentMethod = """
 query getPaymentMethod(\$coordinate: Point!){
  getPaymentMethods(coordinate: \$coordinate) {
    message
    statusCode
    result {
      vendor{
        id
      }
    }
  }
}

  """;
}
