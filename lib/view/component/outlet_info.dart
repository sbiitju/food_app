import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/view/outlet/outlet_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class OutletInfo extends StatefulWidget {
  String? id;

  OutletInfo(this.id, {Key? key}) : super(key: key);

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}

class _OutletInfoState extends State<OutletInfo> {
  final controller = Get.find<OutletController>();

  @override
  Widget build(BuildContext context) {
    controller.getOutlet(widget.id);
    controller.getCategoryItems(widget.id).then((value) => null);
    return Obx(() {
      return Scaffold(
        body: controller.listOfItems.value.isNotEmpty
            ? SingleChildScrollView(
                child: CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      ///Properties of app bar
                      backgroundColor: Colors.white,
                      floating: false,
                      pinned: true,
                      expandedHeight: 200.0,

                      ///Properties of the App Bar when it is expanded
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              shape: BoxShape.rectangle,
                              color: Colors.white),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            imageUrl:
                                controller.outlet.value.coverUrl.toString(),
                          ),
                        ),
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
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
