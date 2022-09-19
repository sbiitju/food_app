import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:get/get.dart';

import '../../../util/function.dart';
import '../../component/checkout_map_address.dart';
import '../cart_controller.dart';
import '../model/cart/cart_reciver.dart';
import 'big_textview.dart';
import 'edit_address_bottomsheet.dart';

class DeliveryAddress extends StatelessWidget {
  DeliveryAddress({Key? key, required this.cartReceiver}) : super(key: key);
  final CartReceiver? cartReceiver;
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextView(text: "DELIVERY ADDRESS"),
                  controller.hasAddress.value
                      ? TextButton(
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            showBottomDialog(
                                context,
                                EditAddressBottomSheet(
                                  orderPlaceAddressList:
                                      controller.orderPlaceList,
                                ));
                          },
                        )
                      : const SizedBox()
                ],
              ),
              controller.hasAddress.value
                  ? Obx(() {
                      debugPrint(
                          controller.customerShoppingCartAddress.value?.name);
                      return CheckOutMapHead(
                        cartReceiver: cartReceiver,
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
    );
  }
}
