import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';

import '../model/order_place_address_model.dart';

class OrderAddressComponent extends StatelessWidget {
  final OrderPlaceAddress orderPlaceAddress;
  final Function(OrderPlaceAddress orderPlaceAddress) checkedListener;

  const OrderAddressComponent(
      {required this.orderPlaceAddress,
      required this.checkedListener,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkedListener(orderPlaceAddress);
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  orderPlaceAddress.isSelected ?? false
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: getScreenWidth(context) / 1.58,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderPlaceAddress.tagName ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: orderPlaceAddress.isSelected ?? false
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).textTheme.headline1?.color),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(orderPlaceAddress.receiverName ?? ""),
                      SmallTextView(
                        text: orderPlaceAddress.receiverNumber ?? "",
                      ),
                      Text(orderPlaceAddress.address ?? "")
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit,
                    color: orderPlaceAddress.isSelected ?? false
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color)),
          ],
        ),
      ),
    );
  }
}
