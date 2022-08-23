import 'package:flutter/material.dart';

import '../../data/model/outlet_model.dart';

class Categories extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  List<CategoryItems>? listOfItems;

  Categories(
      {Key? key,
      required this.onChanged,
      required this.selectedIndex,
      required this.listOfItems})
      : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late ScrollController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = ScrollController();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    controller.animateTo(150.0 * widget.selectedIndex,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            widget.listOfItems!.length,
            (index) => TextButton(
                onPressed: () {
                  widget.onChanged(index);
                },
                style: TextButton.styleFrom(
                    primary: widget.selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor),
                child: Text(
                  widget.listOfItems![index].name!,
                ))),
      ),
    );
  }
}
