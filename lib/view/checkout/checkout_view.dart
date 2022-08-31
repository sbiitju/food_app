import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/checkout/checkout_controller.dart';
import 'package:food_app/view/checkout/component/order_place_popup.dart';
import 'package:food_app/view/component/customized_container.dart';
import 'package:get/get.dart';

import '../cart/cart_component/medium_text_view.dart';
import '../cart/cart_component/small_text_view.dart';
import '../component/checkout_map_address.dart';
import 'component/payment_method.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final controller = Get.find<CheckOutController>();

  @override
  void initState() {
    controller.setDeliveryAddress();
    controller.getCustomerShoppingCartAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("called obx");
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: getScreenWidth(context),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: MaterialButton(
              onPressed: () {
                Get.dialog(OrderPlacePopUp());
              },
              child: BigTextView(text: "Confirm Order"),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomizedContainer(
              maxWidth: getScreenWidth(context),
              maxHeight: getScreenHeight(context) / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigTextView(text: "DELIVERY ADDRESS"),
                            controller.hasAddress.value
                                ? TextButton(
                                    child: const Text("Change"),
                                    onPressed: () {},
                                  )
                                : const SizedBox()
                          ],
                        ),
                        controller.hasAddress.value
                            ? Obx(() {
                                debugPrint(controller
                                    .customerShoppingCartAddress.value?.name);
                                return CheckOutMapHead(
                                  deliveryAddress:
                                      controller.deliveryAddress.value!,
                                );
                              })
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  BigTextView(text: "Please add your address"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SmallTextView(
                                      text:
                                          "Let's get the food delivered where you want it!"),
                                  SizedBox(
                                    width: getScreenWidth(context),
                                    child: MaterialButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {},
                                      child: Text("Add new Address"),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        BigTextView(
                          text: "PAYMENT METHOD",
                        ),
                        Obx(() {
                          return ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 5,
                                );
                              },
                              itemCount: controller.paymentMethodList.length,
                              itemBuilder: (context, index) {
                                return PaymentMethod(
                                  paymentUiModel:
                                      controller.paymentMethodList[index],
                                  checkedListener: (value) {
                                    controller.setPaymentMethod(value);
                                  },
                                );
                              });
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
