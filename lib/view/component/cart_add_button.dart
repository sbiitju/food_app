import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/map/map_controller.dart';
import 'package:get/get.dart';

import '../../data/model/item.dart';
import '../../data/repo/cart/cart_repo.dart';
import '../../util/function.dart';
import '../cart/cart_controller.dart';

class CartUpdateButton extends StatefulWidget {
  const CartUpdateButton({required this.item, Key? key}) : super(key: key);
  final Item item;

  @override
  State<CartUpdateButton> createState() => _CartUpdateButtonState();
}

class _CartUpdateButtonState extends State<CartUpdateButton> {
  final CartRepo cartRepository = Get.find(tag: (CartRepo).toString());
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
    super.deactivate();
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
    cartRepository
        .addToCart(widget.item, mapController.latLon.value)
        .then((value) => controller.getCart());
  }

  void removeCart() {}
}
