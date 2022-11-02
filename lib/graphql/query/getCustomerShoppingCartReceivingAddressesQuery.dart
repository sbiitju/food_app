class GetCustomerShoppingCartReceivingAddresses {
  String getCustomerShoppingCartReceivingAddresses = """
  query getCustomerShoppingCartReceivingAddresses{
  getCustomerShoppingCartReceivingAddresses {
    message
    statusCode
    result {
      id
      location
      receiverName
      houseNo
      streetNo
      blockNo
      address
      category
      phone
      countryCode
      areaName
      floorNumber
      unicode
      emoji
      isDefaultAddress
      isSelected
      addressType
      isOwnAddress
    }
  }
}
  """;
}
