import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/item_list.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomizedContainer(
                maxHeight: getScreenHeight(context) / 7,
                maxWidth: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 1,
                  child: Center(
                    child: CustomizedContainer(
                      maxHeight: getScreenHeight(context) / 10,
                      maxWidth: getScreenWidth(context) / 2,
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
              const SizedBox(
                height: 10,
              ),
              CartItemList(itemListModelList: getDemoItemList()),
            ],
          ),
        ),
      ),
    );
  }
}
