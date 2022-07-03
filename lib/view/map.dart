import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/view/Home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../get/controller.dart';

class MapSample extends StatefulWidget {
  Position position;

  MapSample(this.position, {Key? key}) : super(key: key);

  static const RouteName = "MapSample";

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kLake;
  late CameraPosition myPosition;
  final Controller myController = Get.find<Controller>();

  @override
  void initState() {
    myController.isServiceAvailable.value = myController.getZone(
        widget.position.latitude, widget.position.longitude);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var latlon = LatLng(0, 0);
    Set<Marker> markers = {};
    const MarkerId markerId = MarkerId("My Location");
    var arg = ModalRoute.of(context)!.settings.arguments as Position;
    myPosition =
        CameraPosition(target: LatLng(arg.latitude, arg.longitude), zoom: 14.5);
    _kLake = CameraPosition(
      target: LatLng(arg.latitude, arg.longitude),
      zoom: 14.5,
    );
    Marker marker = Marker(
      position: LatLng(arg.latitude, arg.longitude),
      infoWindow: const InfoWindow(title: "", snippet: '*'),
      markerId: markerId,
    );
    updateCameraPosition(CameraPosition position) {
      latlon = position.target;
      myController
          .getReverseGeoCode(
              position.target.latitude, position.target.longitude)
          .then((value) => myController.address.value = value);
      myController.isServiceAvailable.value = myController.getZone(
          position.target.latitude, position.target.longitude);
      print(position);
    }

    return Scaffold(body: Obx(() {
      return Stack(
        children: [
          GoogleMap(
            onCameraMove: updateCameraPosition,
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: markers,
            // markers: Set<Marker>.of(markers.values),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height - 150,
              left: MediaQuery.of(context).size.width - 60,
              child: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () {
                  setState(() {
                    _controller.future.then((value) => {
                          value.animateCamera(
                              CameraUpdate.newCameraPosition(myPosition))
                        });
                  });
                },
              )),
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
                    Text(
                      myController.address.value.areaName +
                          "," +
                          myController.address.value.cityName +
                          ", ${myController.address.value.districtName}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
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
                    color: myController.isServiceAvailable.value
                        ? Colors.redAccent
                        : Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                    onPressed: !myController.isServiceAvailable.value
                        ? null
                        : () {
                            Get.to(Home(latlon));
                          },
                    child: myController.isServiceAvailable.value
                        ? Text("Select Location")
                        : Text("No Service Available")),
              ),
            ),
          )
        ],
      );
    }));
  }
}
