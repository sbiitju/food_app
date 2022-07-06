import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/view/component/items_card.dart';
import 'package:food_app/view/component/outelt_info_appbar_card.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/model/outlet_model.dart';
import '../get/controller.dart';

// ignore: must_be_immutable
class OutletInfo extends StatefulWidget {

  String? id;

  OutletInfo(this.id,{Key? key}) : super(key: key);

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}

class _OutletInfoState extends State<OutletInfo> {
  var controller = Get.find<Controller>();
  OutletInfoModel? outlet;
  var outletCheck = false;
  var listOutItemsCheck = false;
  List<CategoryItems>? listOfItems;

  @override
  void initState() {
    super.initState();
    controller.getOutlet(widget.id).then((value){
      outlet=value;
      setState((){
        outletCheck=true;
      });
    });
    controller.getCategoryItems(widget.id).then((value) {
      listOfItems = value;
      setState((){
        listOutItemsCheck=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("Shahin${listOfItems}");
    return Scaffold(
      body:(outletCheck && listOutItemsCheck)? SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(child: OutletInfoAppBar(outlet!)),
              Positioned(
                  top: 180,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 110,
                        ),
                        SizedBox(
                          height: 30,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: outlet?.cuisines.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          outlet!.cuisines[index]
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:listOfItems?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: Text(
                                            listOfItems![index].name.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: ItemsCard(listOfItems![index].items),
                                        ),
                                    );
                              }),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  left: 10,
                  right: 10,
                  top: 120,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Card(
                        elevation: 2, child: OutletInfoCard(outlet!)),
                  )),
            ],
          ),
        ),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
