import 'package:flutter/material.dart';
import 'package:food_app/view/auth/auth_view.dart';
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
                    collapseMode: CollapseMode.pin,
                    background: Stack(clipBehavior: Clip.hardEdge, children: [
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
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: OutletInfoCard(outlet!)))
                    ]),
                  ),
                  leadingWidth: 50,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 45,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ))),
                  ),
                  title: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        width: 48,
                        child: IconButton(
                            onPressed: () {
                              Get.to(AuthPage());
                            },
                            icon: const Icon(
                              Icons.search_sharp,
                              color: Colors.red,
                            ))),
                  ),
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
                        height: getLengtOfList(listOfItems!) * 200,
                        child: Stack(
                          children: [
                            Positioned(
                                child: Column(
                              children: [
                                Flexible(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: listOfItems?.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            title: Text(
                                              listOfItems![index]
                                                  .name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: ItemsCard(
                                                listOfItems![index].items),
                                          ),
                                        );
                                      }),
                                ),
                              ],
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

int getLengtOfList(List<CategoryItems> list) {
  int length = 0;
  list.forEach((element) {
    length = length + element.items.length;
  });
  return length;
}
