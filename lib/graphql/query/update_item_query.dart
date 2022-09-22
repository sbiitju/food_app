class UpdateItemQuery {
  String removeItemQuery = """
mutation RemoveItem(\$itemInput:ShoppingCartItemInput!) {
    removeItem (item: \$itemInput) {
        message
        statusCode
        result {
            fingerprint
        }
    }
}

  """;
  String subtractItemQuery = """
mutation SubtractItem(\$itemInput:ShoppingCartItemInput!) {
    subtractItem (item: \$itemInput) {
        message
        statusCode
        result {
            fingerprint
        }
    }
}
  """;
  String resetCart = """
  mutation ResetCart {
    resetCart {
        statusCode
        message
        result {
            fingerprint
            isSync
        }
    }
}
  """;
}
