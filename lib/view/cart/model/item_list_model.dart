class ItemListModel {
  final String itemName;
  final String itemPrice;
  int? itemCount;

  ItemListModel(
      {required this.itemName, required this.itemPrice, this.itemCount});
}
