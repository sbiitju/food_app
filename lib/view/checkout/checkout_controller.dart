import 'package:food_app/data/repo/checkout/checkout_repo.dart';
import 'package:food_app/view/checkout/model/delivery_address_model.dart';
import 'package:food_app/view/checkout/model/order_place_address_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model/payment_ui_model.dart';

class CheckOutController extends GetxController {
  final CheckOutRepo _repository = Get.find(tag: (CheckOutRepo).toString());

  Rx<DeliveryAddress?> deliveryAddress = Rx(null);
  Rx<DeliveryAddress?> customerShoppingCartAddress = Rx(null);

  late var paymentMethodList = <PaymentUiModel>[
    PaymentUiModel(("assest/a.webp"), "Cash On Delivery", false),
    PaymentUiModel(("assest/a.webp"), "Online Payment", false),
    PaymentUiModel(("assest/ic_mobile_banking.png"), "Mobile Payment", false),
  ].obs;

  late var orderPlaceList = <OrderPlaceAddress>[
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
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

  getCustomerShoppingCartAddress() {
    _repository
        .getCustomerShoppingCartAddress()
        .then((value) => customerShoppingCartAddress.value = value);
  }

  setDeliveryAddress() {
    deliveryAddress.value = DeliveryAddress(
        "Md. Imam Hossain", "01613163", LatLng(23, 90), "address");
  }
}
