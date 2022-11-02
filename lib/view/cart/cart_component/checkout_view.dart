import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:get/get.dart';

import 'medium_text_view.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final controller = Get.find<CartController>();

  @override
  void initState() {
    controller.getCustomerShoppingCartAddress();
    controller.getPaymentMethods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).iconTheme.color),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: MediumTextView(text: "My Cart"),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [],
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Container(
                    width: getScreenWidth(context),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: MaterialButton(
                      onPressed: () {
                        controller.placeRegularOrder();
                      },
                      child: BigTextView(text: "Confirm Order"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
