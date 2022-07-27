class AddItemQuery {
  String addItemQuery = """
  mutation AddItem(\$point: Point! \$itemInput:ShoppingCartItemInput!) {
    addItem (coordinate: \$point item: \$itemInput) {
        message
        statusCode
        result {
            fingerprint
            }
        }
}
  """;
}
