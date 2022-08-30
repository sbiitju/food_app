import 'package:flutter/material.dart';

import '../../../data/model/cart/Item.dart';
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
          child: MediumTextView(text: itemListModelList[index].itemName),
        ),
        MediumTextView(text: itemListModelList[index].price.toString()),
      ],
    );
  }
}
