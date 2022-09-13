import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:food_app/view/cart/model/cart/cart.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/item.dart';
import 'cart_component/order_place_popup.dart';
import 'model/delivery_address_model.dart';
import 'model/order_place_address_model.dart';
import 'model/payment_ui_model.dart';

class CartController extends GetxController {
  final CartRepo _cartRepository = Get.find(tag: (CartRepo).toString());

  Rx<DeliveryAddress?> deliveryAddress = Rx(null);
  Rx<DeliveryAddress?> customerShoppingCartAddress = Rx(null);
  var loginStatus = false.obs;

  late var paymentMethodList = <PaymentUiModel>[].obs;

  late var orderPlaceList = <OrderPlaceAddress>[
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
    OrderPlaceAddress("Home", "Shahin Bashar", "01613162522",
        "Jahangirnagar University", LatLng(20, 30), false),
  ].obs;

  RxBool hasAddress = true.obs;
  late final Rx<Cart?> cart = _cartRepository.cart;

  Future addItem(Item itemInfo, LatLng latLng) {
    return _cartRepository.addToCart(itemInfo, latLng);
  }

  getCart() {
    _cartRepository.getCart().then((value) {});
  }

  placeRegularOrder() {
    _cartRepository.placeRegularOrder(23, 90, "fingerPrint").then((value) {
      if (value.isNotEmpty) {
        _cartRepository.cart.value = null;
        Get.dialog(OrderPlacePopUp());
      } else {
        Get.snackbar("Error", "Something is wrong");
      }
    });
  }

  setPaymentMethod(PaymentUiModel paymentUiModel) {
    for (var element in paymentMethodList) {
      element.isSelected = false;
    }
    paymentUiModel.isSelected = !paymentUiModel.isSelected;
    paymentMethodList.value = paymentMethodList.value.map((e) => e).toList();
  }

  getPaymentMethods() {
    _cartRepository
        .getPaymentMethod(23, 90)
        .then((value) => paymentMethodList.value = value);
  }

  setAddress(OrderPlaceAddress orderPlaceAddress) {
    for (var element in orderPlaceList) {
      element.isSelected = false;
    }
    orderPlaceAddress.isSelected = !orderPlaceAddress.isSelected;
    orderPlaceList.value = orderPlaceList.value.map((e) => e).toList();
  }

  getCustomerShoppingCartAddress() {
    _cartRepository
        .getCustomerShoppingCartAddress()
        .then((value) => customerShoppingCartAddress.value = value);
  }

  setDeliveryAddress() {
    deliveryAddress.value = DeliveryAddress(
        "Md. Imam Hossain", "01613163", LatLng(23, 90), "address");
  }
}
