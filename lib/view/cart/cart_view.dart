import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:food_app/view/component/customized_container.dart';
import 'package:food_app/view/outlet_info.dart';
import 'package:get/get.dart';

class MyCartView extends GetView<CartController> {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            MediumTextView(text: "My Cart"),
            SizedBox(
              height: 20,
              child: SmallTextView(
                text: "Demo Text",
                onPressed: () {
                  Get.to(OutletInfo(""));
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomizedContainer(
              height: getScreenHeight(context) / 7,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 1,
                child: Center(
                  child: CustomizedContainer(
                    height: getScreenHeight(context) / 10,
                    width: getScreenWidth(context) / 2,
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.ac_unit),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SmallTextView(text: "Delivery Time"),
                                BigTextView(text: "40-45 Mins")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
