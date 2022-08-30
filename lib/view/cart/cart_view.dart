import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/invoice_list.dart';
import 'package:food_app/view/cart/cart_component/item_list.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:food_app/view/checkout/checkout_view.dart';
import 'package:food_app/view/checkout/model/delivery_address_model.dart';
import 'package:food_app/view/component/customized_container.dart';
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
                    SizedBox(
                      height: 20,
                      child: SmallTextView(
                        text: cart!.outletName,
                        onPressed: () {
                          Get.to(OutletInfo(""));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: CustomizedContainer(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.ac_unit),
                                            Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SmallTextView(
                                                    text: "Delivery Time"),
                                                BigTextView(
                                                    text: cart.deliveryTime)
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: CartItemList(
                                  itemListModelList: cart.listOfItems)),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: CartInvoiceList(
                                  invoiceModelList: cart.listOfInvoice)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: getScreenWidth(context),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                        child: BigTextView(text: "Review Payment and Address"),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
