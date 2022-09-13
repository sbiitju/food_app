import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_view.dart';
import 'package:get/get.dart';

import '../../../data/repo/cart/cart_repo.dart';

class CartNavigationCard extends StatelessWidget {
  CartNavigationCard({Key? key}) : super(key: key);
  final CartRepo cartRepository = Get.find(tag: (CartRepo).toString());

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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("View Cart", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
