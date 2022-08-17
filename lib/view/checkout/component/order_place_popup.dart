import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/checkout/component/address_component.dart';
import 'package:food_app/view/checkout/model/order_place_address_model.dart';

class OrderPlacePopUp extends StatelessWidget {
  const OrderPlacePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assest/img_login.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Thank You For Ordering!",
              style: TextStyle(
                  fontSize: 25,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your order will be at your \n doorstep soon",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10))),
              child: MaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Color(0xFFFFFF),
                      context: context,
                      builder: (context) {
                        return EditAddressBottomSheet(
                          orderPlaceAddressList: getOrderAddressList(),
                        );
                      });
                },
                child: const Text("Track Order"),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<OrderPlaceAddress> getOrderAddressList() {
    return [
      OrderPlaceAddress(
          "Home", "Md. Shahin Bashar", "+8801613162522", "JU,BBH,213"),
      OrderPlaceAddress(
          "Home", "Md. Shahin Bashar", "+8801613162522", "JU,BBH,213"),
      OrderPlaceAddress(
          "Home", "Md. Shahin Bashar", "+8801613162522", "JU,BBH,213"),
      OrderPlaceAddress(
          "Home", "Md. Shahin Bashar", "+8801613162522", "JU,BBH,213"),
    ];
  }
}

class EditAddressBottomSheet extends StatelessWidget {
  final List<OrderPlaceAddress> orderPlaceAddressList;

  const EditAddressBottomSheet({
    required this.orderPlaceAddressList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getScreenHeight(context),
          maxWidth: getScreenWidth(context)),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
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
              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: orderPlaceAddressList.length,
                  itemBuilder: (context, index) {
                    return OrderAddressComponent(
                        orderPlaceAddress: orderPlaceAddressList[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
