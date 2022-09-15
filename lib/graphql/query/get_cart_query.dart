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
       receiver {
                   id
                    category
                    receiverName
                    location
                    address
                    countryCode
                    phone
                  
                }
         payment{
         type
          deliveryCharge
          finalTotal
          itemSubtotal
        }
        outlet{
             id
             name
             images {
                        thumbnail
                    }
                    restaurant {
                        id
                        name
                    }
                    deliveryFee
                    deliveryTime                   
        }
         items {
                    id
                    meta {
                        name
                        description
                    }
                    quantity
                    variant{
                        id
                        name
                        additionalPrice
                    }
                    toppings{
                        id
                        name
                        quantity
                        additionalPrice
                    }
                    basePrice
                    price
                }
                itemWisePaymentDetails {
                    title
                    colorCode
                    value
                }
      }
    }
  }
}
  """;
}
