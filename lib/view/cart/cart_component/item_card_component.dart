import 'package:flutter/material.dart';

import '../model/cart/cart_item.dart';
import 'medium_text_view.dart';

class ItemCardComponent extends StatelessWidget {
  final int index;

  const ItemCardComponent(
      {Key? key, required this.itemListModelList, required this.index})
      : super(key: key);

  final List<CartItem> itemListModelList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            itemListModelList[index].itemName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        MediumTextView(text: itemListModelList[index].price.toString()),
      ],
    );
  }
}
