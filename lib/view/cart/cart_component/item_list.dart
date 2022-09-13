import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';

import '../model/cart/Item.dart';
import 'item_card_component.dart';

class CartItemList extends StatelessWidget {
  List<CartItem> itemListModelList;

  CartItemList({Key? key, required this.itemListModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = itemListModelList.length > 1 ? "Items" : "Item";
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          children: [
            SmallTextView(
                text: "${itemListModelList.length} $item in the cart"),
            const SizedBox(
              height: 10,
            ),
            Divider(),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: getScreenHeight(context), minHeight: 30),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemListModelList.length,
                  itemBuilder: (context, itemCount) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ItemCardComponent(
                        itemListModelList: itemListModelList,
                        index: itemCount,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
