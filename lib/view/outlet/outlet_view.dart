import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/auth/auth_view.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
import 'package:food_app/view/outlet/outlet_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/model/category_items_model.dart';
import '../../data/model/outlet_info_model.dart';
import '../cart/cart_component/cart_navigation.dart';
import '../cart/model/cart_popup_model.dart';
import 'category_tab_layout.dart';
import 'menu_categories.dart';

class OutletView extends StatefulWidget {
  String? id;

  OutletView(this.id, {Key? key}) : super(key: key);

  @override
  State<OutletView> createState() => _OutletViewState();
}

class _OutletViewState extends State<OutletView> {
  final OutletController controller = Get.find<OutletController>();
  OutletInfoModel? outlet;
  int selectedCategoryIndex = 0;
  var outletCheck = false;
  var listOutItemsCheck = false;
  final scrollController = ScrollController();
  List<CategoryItems>? listOfItems;
  double outletInfoHeight = 252 - kToolbarHeight;
  List<double> breackPoints = [];

  @override
  void initState() {
    super.initState();
    controller.getOutlet(widget.id).then((value) {
      outlet = value;
      setState(() {
        outletCheck = true;
      });
    });
    controller.getCategoryItems(widget.id).then((value) {
      listOfItems = value;
      scrollController.addListener(() {
        updateBrerackPoint(scrollController.offset);
      });
      createBreackPoints();
      setState(() {
        listOutItemsCheck = true;
      });
    });
  }

  void createBreackPoints() {
    double firstBreackPoint = outletInfoHeight;
    breackPoints.add(firstBreackPoint);
    for (var i = 0; i < listOfItems!.length; i++) {
      double breackPoint =
          breackPoints.last + (190 * listOfItems![i].items.length);
      breackPoints.add(breackPoint);
    }
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i <= index; i++) {
        totalItems += listOfItems![i].items.length;
      }
      scrollController.animateTo(outletInfoHeight + (200 * totalItems),
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  void updateBrerackPoint(double offset) {
    for (var i = 0; i < listOfItems!.length; i++) {
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (listOutItemsCheck && outletCheck)
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    ///First sliver is the App Bar
                    SliverAppBar(
                      ///Properties of app bar
                      backgroundColor: Theme.of(context).backgroundColor,
                      pinned: true,
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      expandedHeight: 200,

                      ///Properties of the App Bar when it is expanded
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                            Stack(clipBehavior: Clip.hardEdge, children: [
                          Positioned(
                              height: 190,
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                height: 250,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                imageUrl: outlet!.coverUrl.toString(),
                              )),
                          Positioned(
                              top: 110,
                              left: 10,
                              right: 10,
                              height: 130,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: OutletInfoCard(outlet!)))
                        ]),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle),
                            width: 45,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Theme.of(context).primaryColor,
                                ))),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: BoxShape.circle),
                              width: 45,
                              child: IconButton(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onPressed: () {
                                    Get.to(AuthPage());
                                  },
                                  icon: Icon(
                                    Icons.search_sharp,
                                    color: Theme.of(context).primaryColor,
                                  ))),
                        ),
                      ],
                    ),
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: CategoryTabLayout(
                            onChanged: scrollToCategory,
                            selectedIndex: selectedCategoryIndex,
                            listOfItems: listOfItems)),
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 10, right: 10, bottom: 100),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, categoryIndex) {
                        return MenuCategories(listOfItems![categoryIndex].name!,
                            listOfItems![categoryIndex].items);
                      }, childCount: listOfItems!.length)),
                    ),
                  ],
                ),
                Visibility(
                  visible: controller.isCartPopUpShowing.value,
                  child: CartNavigationCard(
                    cartPopUpModel: CartPopUpModel(10, 1000),
                  ),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
