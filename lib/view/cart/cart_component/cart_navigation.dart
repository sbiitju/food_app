import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_view.dart';
import 'package:food_app/view/cart/model/cart_popup_model.dart';
import 'package:get/get.dart';

class CartNavigationCard extends StatelessWidget {
  const CartNavigationCard({required this.cartPopUpModel, Key? key})
      : super(key: key);
  final CartPopUpModel cartPopUpModel;

  @override
  Widget build(BuildContext context) {
    final item = cartPopUpModel.numberOfItems > 1 ? "Items" : "Item";

    return Container(
      color: Theme.of(context).backgroundColor,
      height: 80,
      width: getScreenWidth(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
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
                  Text(
                      "${cartPopUpModel.numberOfItems} $item | Tk. ${cartPopUpModel.totalAmount}"),
                  Text("View Cart")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
