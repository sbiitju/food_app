import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  static const RouteName = "MapSample";

  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _kLake;

  @override
  Widget build(BuildContext context) {
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
      print(position);
    }

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: updateCameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.hybrid,
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
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Search Delivery Address",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.redAccent,
              child: const Align(
                alignment: Alignment.center,
                child: Text("Select Location"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
