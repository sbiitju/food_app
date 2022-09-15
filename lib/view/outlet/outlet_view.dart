import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
import 'package:food_app/view/outlet/outlet_controller.dart';
import 'package:get/get.dart';

import '../cart/cart_component/cart_navigation.dart';
import 'category_tab_layout.dart';
import 'menu_categories.dart';

class OutletView extends StatefulWidget {
  final String? id;

  OutletView(this.id, {Key? key}) : super(key: key);

  @override
  State<OutletView> createState() => _OutletViewState();
}

class _OutletViewState extends State<OutletView> {
  final OutletController controller = Get.find<OutletController>();

  @override
  void initState() {
    controller.getOutlet(widget.id);
    controller.getCategoryItems(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.cartRepository.cart.value == null) {
        debugPrint("cart data");
      } else {
        debugPrint(
            "cart data ${controller.cartRepository.cart.value!.outletName.toString()}");
      }
      return Scaffold(
        body: (controller.listOfItems.isNotEmpty &&
                controller.outlet.value != null)
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomScrollView(
                    controller: controller.scrollController,
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
                                  imageUrl: controller.outlet.value?.coverUrl
                                          .toString() ??
                                      "",
                                )),
                            Positioned(
                                top: 100,
                                left: 10,
                                right: 10,
                                height: 140,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Card(
                                    shadowColor:
                                        Theme.of(context).backgroundColor,
                                    elevation: 20,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: OutletInfoCard(
                                            controller.outlet.value)),
                                  ),
                                ))
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
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: BoxShape.circle),
                                width: 45,
                                child: IconButton(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    onPressed: () {},
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
                              onChanged: controller.scrollToCategory,
                              selectedIndex:
                                  controller.selectedCategoryIndex.value,
                              listOfItems: controller.listOfItems)),
                      SliverPadding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 100),
                        sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, categoryIndex) {
                          return MenuCategories(
                              controller.listOfItems[categoryIndex].name!,
                              controller.listOfItems[categoryIndex].items);
                        }, childCount: controller.listOfItems.length)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: controller.cartRepository.cart.value != null,
                    child: CartNavigationCard(
                        totalItems: controller
                            .cartRepository.cart.value?.listOfItems?.length
                            .toString(),
                        totalAmount: controller.cartRepository.cart.value
                            ?.listOfInvoice?.last.amount),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
