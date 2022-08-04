import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';

import '../../component/customized_container.dart';
import '../model/item_list_model.dart';

class CartItemList extends StatelessWidget {
  List<ItemListModel> itemListModelList;

  CartItemList({Key? key, required this.itemListModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = itemListModelList.length > 1 ? "Items" : "Item";
    return CustomizedContainer(
      color: Theme.of(context).backgroundColor,
      maxHeight: getScreenHeight(context),
      maxWidth: getScreenWidth(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    itemCount: itemListModelList.length,
                    itemBuilder: (context, itemCount) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BigTextView(
                                  text: itemListModelList[itemCount].itemName),
                            ),
                            MediumTextView(
                                text: itemListModelList[itemCount].itemPrice),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
