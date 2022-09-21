import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_view.dart';
import 'package:food_app/view/home/home_controller.dart';
import 'package:get/get.dart';

class CartNavigationCard extends GetView<HomeController> {
  CartNavigationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final item = cartRepository.totalItem > 1 ? "Items" : "Item";
    return Obx(() => (controller.cartRepository.cart.value != null)
        ? Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(MyCartView());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${controller.cartRepository.cart.value?.listOfItems?.length.toString() ?? "0"} ${int.parse(controller.cartRepository.cart.value?.listOfItems?.length.toString() ?? "0") > 0 ? "item" : "items"} | ${controller.cartRepository.cart.value?.listOfInvoice?.last.amount}",
                              style: TextStyle(color: Colors.white)),
                          Text("View Cart",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  )),
            ),
          )
        : SizedBox());
  }
}
