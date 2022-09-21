import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/order_status.dart';

class OrderStatusBottomSheet extends StatelessWidget {
  final List<OrderStatus> listOfOrderStatus;

  OrderStatusBottomSheet({required this.listOfOrderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
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
    );
  }
}
