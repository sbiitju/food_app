import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/cart/cart.dart';
import '../../data/repo/cart/cart_repo.dart';
import '../../util/function.dart';
import '../cart/cart_controller.dart';

class CartUpdateButton extends StatefulWidget {
  const CartUpdateButton({required this.itemPrice, Key? key}) : super(key: key);
  final double itemPrice;

  @override
  State<CartUpdateButton> createState() => _CartUpdateButtonState();
}

class _CartUpdateButtonState extends State<CartUpdateButton> {
  final CartRepo cartRepository = Get.find(tag: (CartRepo).toString());

  var controller = Get.find<CartController>();
  int counter = 0;
  var isCounterZero = true;

  void decrement() {
    setState(() {
      if (counter == 1) {
        counter = 0;
        isCounterZero = true;
      } else {
        counter--;
      }
    });
    removeCart(0);
  }

  void increment() {
    controller.addItem();
    setState(() {
      counter++;
      isCounterZero = false;
    });
    addCart(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.topCenter,
        child: CustomizableCounter(
          backgroundColor: Colors.white30,
          onIncrement: (value) {
            addCart(value.toInt());
          },
          onDecrement: (value) {
            removeCart(value.toInt());
          },
          onCountChange: (value) {
            if (checkLoginStatus()) {
              cartRepository.cart.value =
                  Cart("outletName", "restaurantName", "", [], []);
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return loginCheckingDialog(context);
                  });
            }
          },
        ),
      ),
    );
  }

  void addCart(int i) {
    cartRepository.totalItem.value++;
    cartRepository.totalAmount.value += widget.itemPrice;
  }

  void removeCart(int i) {
    if (cartRepository.totalItem.value == 1) {
      cartRepository.totalItem.value = 0;
      cartRepository.totalAmount.value -= widget.itemPrice;
    } else if (cartRepository.totalItem.value > 1) {
      cartRepository.totalItem.value--;
      cartRepository.totalAmount.value -= widget.itemPrice;
    }
    if (cartRepository.totalItem.value == 0 &&
        cartRepository.totalAmount.value == 0) {
      cartRepository.totalItem.value = 0;
      cartRepository.cart.value = null;
    }
  }
}
