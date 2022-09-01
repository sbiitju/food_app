import 'package:flutter/material.dart';
import 'package:food_app/data/model/cart/cart.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../data/repo/cart/cart_repo.dart';

class CartUpdateButton extends StatefulWidget {
  CartUpdateButton({required this.itemPrice, Key? key}) : super(key: key);
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
    updateCart(0);
  }

  void increment() {
    controller.addItem();
    setState(() {
      counter++;
      isCounterZero = false;
    });
    updateCart(1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 45,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2)),
        child: isCounterZero
            ? Center(
                child: MaterialButton(
                    onPressed: () {
                      if (checkLoginStatus()) {
                        cartRepository.cart.value =
                            Cart("outletName", "restaurantName", "", [], []);
                        increment();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return loginCheckingDialog(context);
                            });
                      }
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 20),
                    )))
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: IconButton(
                        onPressed: decrement,
                        icon: Icon(
                          Icons.minimize_rounded,
                          size: 20,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: increment,
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                ],
              ),
      ),
    );
  }

  void updateCart(int i) {
    switch (i) {
      case 0:
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
        break;
      case 1:
        cartRepository.totalItem.value++;
        cartRepository.totalAmount.value += widget.itemPrice;
    }
  }
}
