import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/view/Home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../get/controller.dart';

class MapSample extends StatefulWidget {
  static const RouteName = "MapSample";

  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kLake;
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var latlon=LatLng(0,0);
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    const MarkerId markerId = MarkerId("");
    var arg = ModalRoute.of(context)!.settings.arguments as Position;
    _kLake = CameraPosition(
      target: LatLng(arg.latitude, arg.longitude),
      zoom: 14.5,
    );
    final Marker marker = Marker(
      position: LatLng(arg.latitude, arg.longitude),
      infoWindow: const InfoWindow(title: "", snippet: '*'),
      markerId: markerId,
    );
    markers[markerId] = marker;
    void updateCameraPosition(CameraPosition position) {
      latlon=position.target;
      controller
          .getReverseGeoCode(
              position.target.latitude, position.target.longitude)
          .then((value) => controller.address.value = value);
      controller.isServiceAvailable.value =controller.getZone(
          position.target.latitude, position.target.longitude);
      print(position);
    }

    return Scaffold(body: Obx(() {
      return Stack(
        children: [
          GoogleMap(
            onCameraMove: updateCameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            // markers: Set<Marker>.of(markers.values),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 45.0,
              ),
              child: Icon(Icons.location_on, color: Colors.redAccent, size: 50),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 55, left: 10, right: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( controller.address.value.areaName + "," +
                        controller.address.value.cityName +
                        ", ${controller.address.value.districtName}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 15,
                    ),),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //       hintText: "Search Delivery Address",
                    //       suffixIcon: Icon(Icons.search),
                    //       border: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.white70, width: 1),
                    //           borderRadius: BorderRadius.all(Radius.circular(10))),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.white70, width: 1),
                    //           borderRadius: BorderRadius.all(Radius.circular(10)))),
                    //   textAlign: TextAlign.center,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Please enter some text";
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: controller.isServiceAvailable.value?Colors.redAccent:Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                    onPressed:!controller.isServiceAvailable.value?null: () {
                      var gotItems = controller.getItems();
                      gotItems.then((value) => {
                            if (value == true)
                              {
                                Get.to(Home(latlon))}
                            else
                              {Get.snackbar("Did not get Data", "Loading...")}
                          });
                    },
                    child:controller.isServiceAvailable.value? Text("Select Location"):Text("No Service Available")),
              ),
            ),
          )
        ],
      );
    }));
  }
}
