import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/invoice_list.dart';
import 'package:food_app/view/cart/cart_component/item_list.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:food_app/view/checkout/checkout_view.dart';
import 'package:food_app/view/checkout/model/delivery_address_model.dart';
import 'package:food_app/view/component/outlet_info.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/cart/cart.dart';

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
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 90.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height: 100,
                                  width: getScreenWidth(context),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      border: Border.all(
                                          color:
                                              Theme.of(context).dividerColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Container(
                                      height: 70,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .dividerColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.ac_unit),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SmallTextView(
                                                    text: "Delivery Time"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  cart.deliveryTime,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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
                                      itemListModelList: cart.listOfItems)),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CartInvoiceList(
                                      invoiceModelList: cart.listOfInvoice)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Container(
                            width: getScreenWidth(context),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(CheckOutView(
                                  deliveryAddress: DeliveryAddress(
                                      "Md. Shahin Bashar",
                                      "+8801613162522",
                                      const LatLng(23.7925, 90.4078),
                                      "Jahangirnagar University, Bangobondhu Hall, Room  Number 213"),
                                ));
                              },
                              child: Text(
                                "Review Payment and Address",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
