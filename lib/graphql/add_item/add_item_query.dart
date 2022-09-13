class AddItemQuery {
  String addItemQuery = """
  mutation AddItem(\$coordinate: Point! ,\$item:ShoppingCartItemInput!) {
    addItem (coordinate: \$coordinate,item: \$item) {
        message
        statusCode
        result {
            fingerprint
            }
        }
}
  """;
}
