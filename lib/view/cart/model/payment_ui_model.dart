import 'package:graphql_flutter/graphql_flutter.dart';

class PaymentUiModel {
  final String iconImage;
  final String title;
  final String type;
  bool isSelected;

  PaymentUiModel(this.iconImage, this.title, this.isSelected, this.type);

  static List<PaymentUiModel> parsingPaymentUiModelList(QueryResult result) {
    return [
      PaymentUiModel(("assest/a.webp"), "Cash On Delivery", false, ""),
      PaymentUiModel(("assest/a.webp"), "Online Payment", false, ""),
      PaymentUiModel(
          ("assest/ic_mobile_banking.png"), "Mobile Payment", false, "")
    ];
  }
}
