import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:food_app/view/cart/model/cart/cart.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:food_app/view/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cart_component/order_place_popup.dart';
import 'model/delivery_address_model.dart';
import 'model/order_place_address_model.dart';
import 'model/payment_ui_model.dart';

class CartController extends HomeController {
  final CartRepo _cartRepository = Get.find(tag: (CartRepo).toString());

  Rx<DeliveryAddress?> deliveryAddress = Rx(null);
  Rx<DeliveryAddress?> customerShoppingCartAddress = Rx(null);
  var loginStatus = false.obs;

  late final paymentMethodList = <PaymentUiModel>[].obs;

  late var orderPlaceList = <OrderPlaceAddress>[].obs;

  RxBool hasAddress = true.obs;
  late final Rx<Cart?> cart = _cartRepository.cart;

  Future addItem(CartItem itemInfo, LatLng latLng) {
    return _cartRepository.addToCart(itemInfo, latLng);
  }

  Future getCart() async {
    _cartRepository.getCart().then((value) {
      _cartRepository.cart.value = value;
    });
  }

  Future resetCart() async {
    _cartRepository.resetCart();
  }

  Future setDeliveryAddress(String deliveryAddressId) async {
    _cartRepository
        .setDeliveryAddress(deliveryAddressId)
        .then((value) => getCart());
  }

  Future placeRegularOrder() async {
    _cartRepository.placeRegularOrder().then((value) {
      if (value.isNotEmpty) {
        _cartRepository.cart.value?.restaurantName = null;
        _cartRepository.resetCart();
        getRunningOrder();
        Get.dialog(OrderPlacePopUp(
          orderUid: value,
        ));
      } else {
        Get.snackbar("Error", "Something is wrong");
      }
    });
  }

  Future setPaymentMethod(PaymentUiModel payment) async {
    paymentMethodList.value = paymentMethodList.value.map((e) {
      e.isSelected = payment.type == e.type;
      return e;
    }).toList();
    return _cartRepository.setPaymentMethod(payment.type);
  }

  getPaymentMethods() {
    _cartRepository.getPaymentMethods().then((value) {
      paymentMethodList.value = value
          .map((e) => PaymentUiModel(e.icon ?? "", e.title ?? "",
              e.type == cart.value?.paymentMethodType, e.type ?? ""))
          .toList();
    });
  }

  setAddress(OrderPlaceAddress orderPlaceAddress) {
    for (var element in orderPlaceList) {
      element.isSelected = false;
    }
    orderPlaceAddress.isSelected = !orderPlaceAddress.isSelected!;
    orderPlaceList.value = orderPlaceList.value.map((e) => e).toList();
  }

  getCustomerShoppingCartAddress() async {
    orderPlaceList.value =
        await _cartRepository.getCustomerShoppingCartAddress();
  }
}
