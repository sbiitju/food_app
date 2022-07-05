import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/outlet_model.dart';

class ItemsCard extends StatelessWidget {
  List<ItemInfo> itemInfo;

  ItemsCard(this.itemInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    itemInfo.forEach((element) {
      debugPrint("Bashar"+element.itemName .toString());

    });
    return SizedBox(
      height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap:true ,
          itemCount: itemInfo.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(itemInfo[index].itemName.toString()),
                          Text("Tk ${itemInfo[index].basePrice}"),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: itemInfo[index].itemImage.toString(),
                          ),
                          Positioned(
                              child: MaterialButton(
                                color: Colors.deepOrangeAccent,
                            onPressed: (){},
                            child: Text("Add"),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
    );
  }
}
