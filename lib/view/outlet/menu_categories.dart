import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';

import '../component/items_card.dart';

class MenuCategories extends StatelessWidget {
  final String title;
  final List<CartItem> items;

  MenuCategories(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemsCard(items);
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: items.length)
      ],
    );
  }
}
