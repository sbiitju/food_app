import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/checkout/checkout_controller.dart';
import 'package:get/get.dart';

import 'edit_address_bottomsheet.dart';

class OrderPlacePopUp extends StatelessWidget {
  OrderPlacePopUp({Key? key}) : super(key: key);
  final controller = Get.find<CheckOutController>();

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
            const SizedBox(
              height: 20,
            ),
            const Text(
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
                  showModalBottomSheet(
                      backgroundColor: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      context: context,
                      builder: (context) {
                        return EditAddressBottomSheet(
                          orderPlaceAddressList:
                              controller.orderPlaceList.value,
                        );
                      });
                },
                child: const Text("Track Order"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
