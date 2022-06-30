import 'package:flutter/material.dart';
import 'package:food_app/get/controller.dart';
import 'package:food_app/view/Splash.dart';
import 'package:food_app/view/component/restuarent_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  LatLng latLng;

  Home(this.latLng, {Key? key}) : super(key: key);

  static const RouteName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;
  Controller controller = Get.find<Controller>();
  var scrollController = ScrollController();

  @override
  void initState() {
    refresh();
    controller.getHpOutletList(
        widget.latLng.latitude, widget.latLng.longitude, _index);
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _index++;
        controller.getHpOutletList(
            widget.latLng.latitude, widget.latLng.longitude, _index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.checking.value
            ? Container(
                child: Obx(() {
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: controller.listOutletId.length + 1,
                        itemBuilder: (context, index) {
                          return index < controller.listOutletId.length
                              ? GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:(cotext){
                                  return SplashScreen();
                                } ));
                              },
                              child: ResturentCard(controller.listOutletId[index]))
                              : const Center(
                                  child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CircularProgressIndicator(),
                                ));
                        }),
                  );
                }),
              )
            : Builder(
              builder: (context) {
                return Center(
                    child: CircularProgressIndicator(),
                  );
              }
            ),
      ),
    );
  }

  Future<void> refresh() async {
    controller.listOutletId.value.clear();
    _index = 0;
    controller.getHpOutletList(
        widget.latLng.latitude, widget.latLng.longitude, _index);
  }
}
