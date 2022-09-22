import 'package:flutter/material.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:food_app/view/component/cart_add_button.dart';

class ItemsCard extends StatefulWidget {
  List<CartItem> itemInfo;

  ItemsCard(this.itemInfo, {Key? key}) : super(key: key);

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  @override
  Widget build(BuildContext context) {
    for (final element in widget.itemInfo) {
      debugPrint("Bashar${element.itemName}");
    }
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Divider(),
        shrinkWrap: true,
        itemCount: widget.itemInfo.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.itemInfo[index].itemName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              textBaseline: TextBaseline.alphabetic,
                              wordSpacing: 2),
                        ),
                        Text(
                          "Tk ${widget.itemInfo[index].price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              textBaseline: TextBaseline.alphabetic,
                              wordSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 120,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 100,
                              child: Image.network(
                                widget.itemInfo[index].thumbnail,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset("assest/a.webp"),
                              )),
                          Positioned(
                            top: 75,
                            left: 5,
                            right: 5,
                            bottom: 5,
                            child:
                                CartUpdateButton(item: widget.itemInfo[index]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
