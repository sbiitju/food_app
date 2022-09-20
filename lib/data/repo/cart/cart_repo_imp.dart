import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:food_app/view/cart/model/cart/cart_payment_method.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../util/function.dart';
import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/order_place_address_model.dart';
import '../../model/item.dart';

class CartRepoImp implements CartRepo {
  final CartDataSource _remoteSource =
      Get.find(tag: (CartDataSource).toString());

  @override
  Rx<Cart?> cart = Rx(null);

  @override
  Future<Cart> getCart() async {
    String? fingerPrint;
    await getFingerPrint().then((value) => fingerPrint = value);
    return _remoteSource
        .getCart(fingerPrint ?? "")
        .then((value) => cart.value = value);
  }

  @override
  Future addToCart(Item itemInfo, LatLng latLng) async {
    String? fingerPrint = await getFingerPrint();
    _remoteSource
        .addToCart(itemInfo, latLng, fingerPrint)
        .then((value) => getCart());
  }

  @override
  Future<List<OrderPlaceAddress>> getCustomerShoppingCartAddress() {
    return _remoteSource.getCustomerShoppingCartAddress();
  }

  @override
  Future<String> placeRegularOrder() async {
    String? fingerPrint = await getFingerPrint();
    return _remoteSource.placeRegularOrder(fingerPrint);
  }

  @override
  Future<List<CartPaymentMethod>> getPaymentMethods() {
    //Todo: need to fetch lat lon from local
    return _remoteSource.getPaymentMethods(0.0, 0.0);
  }

  @override
  Future setPaymentMethod(String paymentType) async {
    String? fingerPrint = await getFingerPrint();
    return _remoteSource.setPaymentMethod(fingerPrint, paymentType);
  }

  @override
  Future setDeliveryAddress(String deliveryAddressId) async {
    String? fingerPrint = await getFingerPrint();
    return _remoteSource.setDeliveryAddress(fingerPrint, deliveryAddressId);
  }
}
