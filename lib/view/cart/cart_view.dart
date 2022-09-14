import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/invoice_list.dart';
import 'package:food_app/view/cart/cart_component/item_list.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:food_app/view/cart/model/cart/cart.dart';
import 'package:food_app/view/component/outlet_info.dart';
import 'package:get/get.dart';

import 'cart_component/big_textview.dart';
import 'cart_component/delivery_address.dart';
import 'cart_component/payment_method.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  final controller = Get.find<CartController>();

  @override
  void initState() {
    controller.getCart();
    controller.setDeliveryAddress();
    controller.getCustomerShoppingCartAddress();
    controller.getPaymentMethods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Cart? cart = controller.cart.value;
      return controller.cart.value == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
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
                title: Column(
                  children: [
                    MediumTextView(text: "My Cart"),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: SizedBox(
                        height: 18,
                        child: SmallTextView(
                          text: "${cart!.outletName} - ${cart.restaurantName}",
                          onPressed: () {
                            Get.to(OutletInfo(""));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: Container(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 90.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 100,
                                    width: getScreenWidth(context),
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: getDeliveryTimeCard(context, cart),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CartItemList(
                                        itemListModelList:
                                            cart.listOfItems ?? [])),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CartInvoiceList(
                                        invoiceModelList:
                                            cart.listOfInvoice ?? [])),
                                DeliveryAddress(
                                  cartReceiver: cart.cartReceiver,
                                ),
                                getPaymentCard(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Theme.of(context).backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Container(
                              width: getScreenWidth(context),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.placeRegularOrder();
                                },
                                child: Text(
                                  "Confirm Order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
    });
  }

  Widget getPaymentCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          paymentUiModel: controller.paymentMethodList[index],
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
    );
  }

  Widget getDeliveryTimeCard(BuildContext context, Cart cart) {
    return Container(
      height: 70,
      width: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.ac_unit),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallTextView(text: "Delivery Time"),
                SizedBox(
                  height: 5,
                ),
                Text(
                  cart.deliveryTime.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
