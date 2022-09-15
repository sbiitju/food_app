import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_view.dart';
import 'package:get/get.dart';

class CartNavigationCard extends StatelessWidget {
  CartNavigationCard(
      {Key? key, required this.totalAmount, required this.totalItems})
      : super(key: key);
  final String? totalAmount;
  final String? totalItems;

  @override
  Widget build(BuildContext context) {
    // final item = cartRepository.totalItem > 1 ? "Items" : "Item";

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
                        "$totalItems ${int.parse(totalItems.toString()) > 0 ? "item" : "items"} | $totalAmount",
                        style: TextStyle(color: Colors.white)),
                    Text("View Cart", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
