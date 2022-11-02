class SetDeliveryAddress {
  final String setDeliveryAddress = """
  
mutation setDeliveryAddress (\$receivingAddressId: ObjectId!,\$fingerprint:String!) {
  setDeliveryAddress(receivingAddressId: \$receivingAddressId, fingerprint: \$fingerprint) {
    message
    statusCode
    result {
      fingerprint
    }
  }
}

  """;
}
