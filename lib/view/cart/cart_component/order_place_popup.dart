import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../map/map_controller.dart';

class OrderPlacePopUp extends StatelessWidget {
  OrderPlacePopUp({Key? key, required this.orderUid}) : super(key: key);
  final String? orderUid;
  final controller = Get.find<CartController>();
  final MapController mapController = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assest/img_login.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Thank You For Ordering!",
              style: TextStyle(
                  fontSize: 25,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Order ID: $orderUid",
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your order will be at your \n doorstep soon",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10))),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Track Order",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
