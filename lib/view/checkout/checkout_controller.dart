import 'package:get/get.dart';

import 'model/payment_ui_model.dart';

class CheckOutController extends GetxController {
  late var paymentMethodList = <PaymentUiModel>[
    PaymentUiModel(("assest/a.webp"), "Cash On Delivery", false),
    PaymentUiModel(("assest/a.webp"), "Online Payment", false),
    PaymentUiModel(("assest/ic_mobile_banking.png"), "Mobile Payment", false),
  ].obs;

  RxBool hasAddress = true.obs;

  setPaymentMethod(PaymentUiModel paymentUiModel) {
    for (var element in paymentMethodList) {
      element.isSelected = false;
    }
    paymentUiModel.isSelected = !paymentUiModel.isSelected;
    paymentMethodList.value = paymentMethodList.value.map((e) => e).toList();
  }
}
