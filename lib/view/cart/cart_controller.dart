import 'package:flutter/material.dart';
import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:get/get.dart';

import '../../data/model/cart/cart.dart';

class CartController extends GetxController {
  final CartRepo _repository = Get.find(tag: (CartRepo).toString());
  Rx<Cart?> cart = Rx(null);

  Future addItem() {
    return _repository.addToCart();
  }

  Future getCart() {
    return _repository.getCart().then((value) {
      cart.value = value;
      debugPrint(cart.value?.outletName.toString());
    });
  }
}
