import 'package:flutter/material.dart';
import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
import 'package:food_app/view/demo/demo_categories.dart';

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  final scrollController = ScrollController();
  double restuarentInfoHeight = 200 + 130 - kToolbarHeight;
  int selectedCategoryIndex = 0;

  List<double> breackPoints = [];

  void createBreackPoints() {
    double firstBreackPoint = restuarentInfoHeight +
        (200 * demoCategoryMenus[0].items.length) +
        (90 * demoCategoryMenus[0].items.length);
    breackPoints.add(firstBreackPoint);
    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breackPoint =
          breackPoints.last + (90 * demoCategoryMenus[i].items.length);
      breackPoints.add(breackPoint);
    }
  }

  void updateBrerackPoint(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breackPoints[i - 1] <= offset) & (offset < breackPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      scrollController.animateTo(
          restuarentInfoHeight + (200 * totalItems) + (125 * index),
          duration: Duration(milliseconds: 1000),
          curve: Curves.ease);
    }
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  void initState() {
    createBreackPoints();
    scrollController.addListener(() {
      updateBrerackPoint(scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          RestaurantDemoAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: OutletInfoCard(OutletInfoModel(
                  "",
                  "Test",
                  "Test 2",
                  "Brain Station",
                  "https://source.unsplash.com/user/c_v_r/1900x800",
                  "https://source.unsplash.com/user/c_v_r/300x300",
                  20,
                  "2",
                  "20",
                  [""],
                  true,
                  true,
                  "20",
                  20,
                  20)),
            ),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: RestuarantCategories(
                  onChanged: scrollToCategory,
                  selectedIndex: selectedCategoryIndex)),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, categoryIndex) {
              return MenuCategories(demoCategoryMenus[categoryIndex].category,
                  demoCategoryMenus[categoryIndex].items);
            }, childCount: demoCategoryMenus.length)),
          )
        ],
      ),
    );
  }
}

class RestaurantDemoAppBar extends StatelessWidget {
  const RestaurantDemoAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      leading: Icon(Icons.arrow_back),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assest/img_login.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MenuCategories extends StatelessWidget {
  final String title;
  final List<Menu> items;

  MenuCategories(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(),
        ),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MenuCard(
                  items[index].title, items[index].image, items[index].price);
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: items.length)
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String image;
  final double price;

  MenuCard(this.title, this.image, this.price);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 1, child: Image.network(image)),
          Text(title),
          Text(price.toString())
        ],
      ),
    );
  }
}

class RestuarantCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  RestuarantCategories({required this.onChanged, required this.selectedIndex});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: 52,
        color: Theme.of(context).scaffoldBackgroundColor,
        child:
            DemoCategories(onChanged: onChanged, selectedIndex: selectedIndex));
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
