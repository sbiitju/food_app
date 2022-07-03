import 'package:flutter/material.dart';
import 'package:food_app/view/component/outelt_info_appbar_card.dart';
import 'package:food_app/view/component/restuarent_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/model/outlet_model.dart';
import '../get/controller.dart';
// ignore: must_be_immutable
class OutletInfo extends StatefulWidget {
  OutletInfo(this.outlet, {Key? key}) : super(key: key);
  Outlet outlet;

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}

class _OutletInfoState extends State<OutletInfo> {
  var controller= Get.find<Controller>();
  @override
  void initState() {
    controller.getItems(widget.outlet.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutletInfoAppBar(widget.outlet),
          ],
        ),
      ),
    );
  }
}
