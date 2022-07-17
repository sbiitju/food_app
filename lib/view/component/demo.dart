import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/model/outlet_model.dart';
import '../../get/controller.dart';
import 'items_card.dart';
import 'outelt_info_appbar_card.dart';

class SliverListWidget extends StatefulWidget {
  String? id;

  SliverListWidget(this.id, {Key? key}) : super(key: key);

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {
  Controller controller = Get.find<Controller>();
  OutletInfoModel? outlet;
  var outletCheck = false;
  var listOutItemsCheck = false;
  List<CategoryItems>? listOfItems;

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
      setState(() {
        listOutItemsCheck = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (listOutItemsCheck && outletCheck)
          ? CustomScrollView(
              slivers: <Widget>[
                ///First sliver is the App Bar
                SliverAppBar(
                  ///Properties of app bar
                  backgroundColor: Colors.white,
                  floating: false,
                  pinned: true,
                  expandedHeight: 200,

                  ///Properties of the App Bar when it is expanded
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.zero,
                    collapseMode: CollapseMode.parallax,
                    background: Stack(
                      clipBehavior: Clip.hardEdge,
                        children: [
                        Positioned(
                            height: 190,
                            width: MediaQuery.of(context).size.width,
                            child: OutletInfoAppBar(outlet!)),
                          Positioned(
                              top: 110,
                              left: 10,
                              right: 10,
                              height: 130,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                  child: OutletInfoCard(outlet!)))
                        ]),
                  ),
                  leadingWidth: 40,
                  leading: SizedBox(
                    width: 40,
                    height: 30,
                    child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 40,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ))),
                  ),
                  actions: <Widget>[
                    Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 40,
                        child: IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.search_sharp,
                              color: Colors.red,
                            ))),
                  ],
                ),
                SliverList(
                  ///Use SliverChildListDelegate and provide a list
                  ///of widgets if the count is limited
                  ///
                  ///Lazy building of list
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (BuildContext context, int index) {
                      /// To convert this infinite list to a list with "n" no of items,
                      /// uncomment the following line:
                      /// if (index > n) return null;
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Positioned(
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
                                      SizedBox(
                                        height: 30,
                                        child: Expanded(
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  outlet?.cuisines.length,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        outlet!.cuisines[index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                      Flexible(
                                        child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: listOfItems?.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ListTile(
                                                  title: Text(
                                                    listOfItems![index]
                                                        .name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: ItemsCard(
                                                      listOfItems![index]
                                                          .items),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                )),
                            // Positioned(
                            //     left: 10,
                            //     right: 10,
                            //     top: 120,
                            //     child: Container(
                            //       width: MediaQuery.of(context).size.width,
                            //       height: 140,
                            //       decoration: const BoxDecoration(
                            //           borderRadius: BorderRadius.all(
                            //               Radius.circular(20))),
                            //       child: Card(
                            //           elevation: 2,
                            //           child: OutletInfoCard(outlet!)),
                            //     )),
                          ],
                        ),
                      );
                    },

                    /// Set childCount to limit no.of items
                    /// childCount: 100,
                  ),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget listItem(String title) => Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Flexible(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Text("data");
                    }),
              ),
            )
          ],
        ),
      );
}
