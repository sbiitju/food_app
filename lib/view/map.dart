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
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late CameraPosition _kLake;

  @override
  Widget build(BuildContext context) {
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    final MarkerId markerId = MarkerId("");
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
              padding: const EdgeInsets.only(bottom: 95,left: 10,right: 10),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp))
                  ],
                ),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
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
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Select Location"
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
