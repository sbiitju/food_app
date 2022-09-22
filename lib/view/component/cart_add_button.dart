import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:food_app/view/map/map_controller.dart';
import 'package:get/get.dart';

import '../../util/function.dart';
import '../cart/cart_controller.dart';

class CartUpdateButton extends StatefulWidget {
  const CartUpdateButton({required this.item, Key? key}) : super(key: key);
  final CartItem item;

  @override
  State<CartUpdateButton> createState() => _CartUpdateButtonState();
}

class _CartUpdateButtonState extends State<CartUpdateButton> {
  var controller = Get.find<CartController>();
  var mapController = Get.find<MapController>();
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
    removeCart();
  }

  void increment() {
    setState(() {
      counter++;
      isCounterZero = false;
    });
    addCart();
  }

  @override
  void initState() {
    getToken().then((value) => controller.loginStatus.value = value.isNotEmpty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.topCenter,
        child: CustomizableCounter(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.25),
          onIncrement: (value) {
            if (controller.loginStatus.value) {
              addCart();
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return loginCheckingDialog(context);
                  });
            }
          },
          onDecrement: (value) {
            removeCart();
          },
          onCountChange: (value) {},
        ),
      ),
    );
  }

  void addCart() {
    controller
        .addItem(widget.item, mapController.latLon.value)
        .then((value) => controller.getCart());
  }

  void removeCart() {
    controller.removeItem(widget.item.itemId);
  }
}
