class AddItemQuery {
  String addItemQuery = """
  mutation AddItem(\$point: Point! \$itemInput:ShoppingCartItemInput!) {
    addItem (coordinate: \$point item: \$itemInput) {
        message
        statusCode
        result {
            fingerprint
            isSync
            cart {
                payment {
                    type
                    deliveryMethod
                    deliveryCharge
                    outletServiceCharge
                    itemSubtotal
                    globalItemsPrice
                    totalSD
                    vat
                    finalTotal
                    voucherDiscountAmount
                    dealDiscountAmount
                    cartRuleDiscountAmount
                    customerPayable
                    hnCreditUsed
                    riderTip
                }
            }
        }
    }
}
  """;
}
