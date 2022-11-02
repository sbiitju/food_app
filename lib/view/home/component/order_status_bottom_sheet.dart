import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/home/home_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/order_status.dart';

class OrderStatusShowingComponent extends GetView<HomeController> {
  final List<OrderStatus> listOfOrderStatus;

  OrderStatusShowingComponent({required this.listOfOrderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Obx(() {
          return controller.orderStatus.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  listOfOrderStatus[index].restaurantName ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Order ID: ${listOfOrderStatus[index].orderUid}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  listOfOrderStatus[index].stateSummary ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: listOfOrderStatus.length),
                  ),
                )
              : SizedBox();
        }));
  }
}
