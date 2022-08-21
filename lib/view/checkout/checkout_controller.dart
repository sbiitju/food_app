import 'package:food_app/view/checkout/model/order_place_address_model.dart';
import 'package:get/get.dart';

import 'model/payment_ui_model.dart';

class CheckOutController extends GetxController {
  late var paymentMethodList = <PaymentUiModel>[
    PaymentUiModel(("assest/a.webp"), "Cash On Delivery", false),
    PaymentUiModel(("assest/a.webp"), "Online Payment", false),
    PaymentUiModel(("assest/ic_mobile_banking.png"), "Mobile Payment", false),
  ].obs;
  late var orderPlaceList = <OrderPlaceAddress>[
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University,Savar,Dhaka", false),
  ].obs;

  RxBool hasAddress = true.obs;

  setPaymentMethod(PaymentUiModel paymentUiModel) {
    for (var element in paymentMethodList) {
      element.isSelected = false;
    }
    paymentUiModel.isSelected = !paymentUiModel.isSelected;
    paymentMethodList.value = paymentMethodList.value.map((e) => e).toList();
  }

  setAddress(OrderPlaceAddress orderPlaceAddress) {
    for (var element in orderPlaceList) {
      element.isSelected = false;
    }
    orderPlaceAddress.isSelected = !orderPlaceAddress.isSelected;
    orderPlaceList.value = orderPlaceList.value.map((e) => e).toList();
  }
}
