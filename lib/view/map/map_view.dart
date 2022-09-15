import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_app/view/map/map_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../home/home_view.dart';

class MapView extends StatefulWidget {
  Position position;

  MapView(this.position, {Key? key}) : super(key: key);

  static const RouteName = "MapSample";

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Widget? testWidget;
  Widget? testWidget2;
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kLake;
  late CameraPosition myPosition;
  final MapController myController = Get.find<MapController>();

  @override
  void initState() {
    myController
        .getZone(widget.position.latitude, widget.position.longitude)
        .then((value) => myController.isServiceAvailable.value = value);
    myController
        .getReverseGeoCode(widget.position.latitude, widget.position.longitude)
        .then((value) => myController.address.value = value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var latlon = LatLng(widget.position.latitude, widget.position.longitude);
    Set<Marker> markers = {};
    var arg = widget.position;
    myPosition =
        CameraPosition(target: LatLng(arg.latitude, arg.longitude), zoom: 14.5);
    _kLake = CameraPosition(
      target: LatLng(arg.latitude, arg.longitude),
      zoom: 14.5,
    );
    updateCameraPosition(CameraPosition position) {
      latlon = position.target;
      myController
          .getReverseGeoCode(
              position.target.latitude, position.target.longitude)
          .then((value) => myController.address.value = value);
      myController
          .getZone(position.target.latitude, position.target.longitude)
          .then((value) => myController.isServiceAvailable.value = value);
    }

    testWidget = Scaffold(body: Obx(() {
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
                icon: Icon(
                  Icons.my_location,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _controller.future.then((value) => {
                          value.animateCamera(
                              CameraUpdate.newCameraPosition(myPosition))
                        });
                  });
                },
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 45.0,
              ),
              child: Icon(Icons.location_on,
                  color: Theme.of(context).primaryColor, size: 50),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 59, left: 10, right: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10),
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
                      style: const TextStyle(
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
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: myController.isServiceAvailable.value
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10))),
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                    onPressed: !myController.isServiceAvailable.value
                        ? null
                        : () {
                            myController.rawAddress.value = myController
                                    .address.value.areaName +
                                "," +
                                myController.address.value.cityName +
                                ", ${myController.address.value.districtName}";
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView(
                                      latlon, myController.rawAddress.value)),
                              (Route<dynamic> route) => false,
                            );
                            myController.latLon.value = latlon;
                          },
                    child: myController.isServiceAvailable.value
                        ? Text(
                            AppLocalizations.of(context)!.selectLocation,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white),
                          )
                        : Text(
                            "No Service Available",
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
              ),
            ),
          )
        ],
      );
    }));
    debugPrint("Is TestWidget same ${testWidget == testWidget2}");
    testWidget2 = testWidget;
    return testWidget!;
  }
}
