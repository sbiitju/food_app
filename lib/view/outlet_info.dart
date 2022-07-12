import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      shape: BoxShape.rectangle,
                      color: Colors.white),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    imageUrl: outlet!.coverUrl.toString(),
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
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
