class SetPaymentQuery {
  String setPaymentMethod = """
mutation SetPaymentMethod(\$paymentMethod: ShoppingCartPaymentMethodInput!) {
    setPaymentMethod(paymentMethod: \$paymentMethod){
        message
        statusCode
        result {
            fingerprint
        }
    }

}
  """;
}
