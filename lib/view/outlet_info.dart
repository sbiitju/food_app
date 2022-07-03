import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/component/outelt_info_appbar_card.dart';
import 'package:food_app/view/component/outlet_info_card.dart';
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
  var controller = Get.find<Controller>();

  @override
  void initState() {
    controller.getItems(widget.outlet.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(child: OutletInfoAppBar(widget.outlet)),
              Positioned(
                  top: 180,
                  child: Card(
                    elevation: 2,
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

                        ],
                      ),
                    ),
                  )),
              Positioned(
                  left: 10,
                  right: 10,
                  top: 120,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Card(elevation: 10, child: OutletInfoCard()),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
