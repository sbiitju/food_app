import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/cart_navigation.dart';
import 'package:food_app/view/component/restuarent_card.dart';
import 'package:food_app/view/home/home_controller.dart';
import 'package:food_app/view/outlet/outlet_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/category_items_model.dart';
import 'component/home_drawer.dart';
import 'home_item_shimmer.dart';

class HomeView extends StatefulWidget {
  final LatLng latLng;
  final String locationName;

  const HomeView(this.latLng, this.locationName, {Key? key}) : super(key: key);

  static const RouteName = "Home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 1;
  final HomeController controller = Get.find<HomeController>();
  var scrollController = ScrollController();
  var listOfItems = <CategoryItems>[];

  @override
  void initState() {
    refresh();
    controller.getCart();
    controller.getHpOutletList(
        widget.latLng.latitude, widget.latLng.longitude, _index);
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _index++;
        controller.getHpOutletList(
            widget.latLng.latitude, widget.latLng.longitude, _index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.checking.value
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              titleSpacing: 0,
              title: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver To",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.locationName,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            drawer: HomeDrawer(),
            body: SafeArea(
                child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Obx(() {
                    return RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: controller.listOutletId.length + 1,
                          itemBuilder: (context, index) {
                            return index < controller.listOutletId.length
                                ? GestureDetector(
                                    onTap: () {
                                      Get.to(OutletView(
                                          controller.listOutletId[index].id));
                                    },
                                    child: ResturentCard(
                                        controller.listOutletId[index]))
                                : Container(
                                    height: getScreenHeight(context),
                                    child: HomeCardShimmer(),
                                  );
                          }),
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(() {
                    return Visibility(
                      visible:
                          controller.cartRepository.cart.value?.outletName !=
                              null,
                      child: CartNavigationCard(
                          totalItems:
                              controller.cartRepository.cart.value?.quantity ??
                                  "0",
                          totalAmount: controller.cartRepository.cart.value
                              ?.listOfInvoice?.last.amount),
                    );
                  }),
                )
              ],
            )),
          )
        : HomeCardShimmer();
  }

  Future<void> refresh() async {
    controller.listOutletId.value.clear();
    _index = 0;
    controller.getHpOutletList(
        widget.latLng.latitude, widget.latLng.longitude, _index);
  }
}
