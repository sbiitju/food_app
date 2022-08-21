class OrderPlaceAddress {
  final String tagName;
  final String receiverName;
  final String receiverNumber;
  final String address;
  var isSelected = false;

  OrderPlaceAddress(this.tagName, this.receiverName, this.receiverNumber,
      this.address, this.isSelected);
}
