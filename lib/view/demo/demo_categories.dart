import 'package:flutter/material.dart';

class DemoCategories extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  DemoCategories(
      {Key? key, required this.onChanged, required this.selectedIndex})
      : super(key: key);

  @override
  State<DemoCategories> createState() => _DemoCategoriesState();
}

class _DemoCategoriesState extends State<DemoCategories> {
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
  void didUpdateWidget(covariant DemoCategories oldWidget) {
    controller.animateTo(137.0 * widget.selectedIndex,
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
            demoCategoryMenus.length,
            (index) => Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        onPressed: () {
                          widget.onChanged(index);
                        },
                        child: Text(demoCategoryMenus[index].category)),
                  ),
                )),
      ),
    );
  }
}

class Menu {
  final String title, image;
  final double price;

  Menu(this.title, this.image, this.price);
}

class CategoryMenu {
  final String category;
  final List<Menu> items;

  CategoryMenu(this.category, this.items);
}

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu("Most Popular A", [
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 1", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular B", [
    Menu("SandWitch 2 ", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 2 ", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 2 ", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular C", [
    Menu("SandWitch 3", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 3", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular D", [
    Menu("SandWitch 4", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 4", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular E", [
    Menu("SandWitch 5", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 5", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular F", [
    Menu("SandWitch 6", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 6", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular G", [
    Menu("SandWitch 7", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 7", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular H", [
    Menu("SandWitch 8", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 8", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular I", [
    Menu("SandWitch 9", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular J", [
    Menu("SandWitch 10", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch 10", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular K", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular L", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular M", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular N", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular O", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
  CategoryMenu("Most Popular P", [
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
    Menu("SandWitch", "https://source.unsplash.com/user/c_v_r/300x300", 100),
  ]),
];
