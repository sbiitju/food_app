class ItemListModel {
  final itemName;
  final itemPrice;
  int? itemCount;

  ItemListModel(
      {required this.itemName, required this.itemPrice, this.itemCount});
}
