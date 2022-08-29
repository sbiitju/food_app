class GetPaymentQuery {
  String getPayment = """
 query getPayment(\$coordinate: Point!){
  getPaymentMethods(coordinate: \$coordinate,allowNagad: true) {
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
