import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../../util/function.dart';
import '../model/order_place_address_model.dart';
import 'address_component.dart';
import 'big_textview.dart';

class EditAddressBottomSheet extends StatelessWidget {
  final List<OrderPlaceAddress> orderPlaceAddressList;
  final controller = Get.find<CartController>();

  EditAddressBottomSheet({
    required this.orderPlaceAddressList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getScreenHeight(context),
          maxWidth: getScreenWidth(context)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextView(text: "Select Address"),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined)),
              ],
            ),
            Obx(() {
              return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: controller.orderPlaceList.length,
                  itemBuilder: (context, index) {
                    return OrderAddressComponent(
                        checkedListener: (value) {
                          controller.setAddress(value);
                        },
                        orderPlaceAddress: orderPlaceAddressList[index]);
                  });
            }),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CupertinoButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          " Add New Address",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
