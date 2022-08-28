import 'package:flutter/material.dart';

import '../../data/model/category_items_model.dart';
import 'category.dart';

class CategoryTabLayout extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  List<CategoryItems>? listOfItems;

  CategoryTabLayout(
      {required this.onChanged,
      required this.selectedIndex,
      required this.listOfItems});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: 52,
        color: Theme.of(context).backgroundColor,
        child: Categories(
          onChanged: onChanged,
          selectedIndex: selectedIndex,
          listOfItems: listOfItems,
        ));
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
