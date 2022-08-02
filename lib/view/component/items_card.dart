import 'package:flutter/material.dart';
import 'package:food_app/view/component/cart_add_button.dart';

import '../../data/model/outlet_model.dart';

class ItemsCard extends StatefulWidget {
  List<ItemInfo> itemInfo;

  ItemsCard(this.itemInfo, {Key? key}) : super(key: key);

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  @override
  Widget build(BuildContext context) {
    for (final element in widget.itemInfo) {
      debugPrint("Bashar${element.itemName}");
    }
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.itemInfo.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 5,
                  child: Container(),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.itemInfo[index].itemName.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    textBaseline: TextBaseline.alphabetic,
                                    wordSpacing: 2),
                              ),
                              Text(
                                "Tk ${widget.itemInfo[index].basePrice}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    textBaseline: TextBaseline.alphabetic,
                                    wordSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: 120,
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: 100,
                                    child: Image.asset("assest/a.webp")),
                                const Positioned(
                                  top: 75,
                                  left: 10,
                                  right: 10,
                                  child: CartUpdateButton(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            );
          }),
    );
  }
}
