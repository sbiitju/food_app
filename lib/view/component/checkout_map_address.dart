import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../cart/model/cart/cart_reciver.dart';

class CheckOutMapHead extends StatelessWidget {
  CartReceiver? cartReceiver;

  CheckOutMapHead({Key? key, required this.cartReceiver}) : super(key: key);
  late CameraPosition _kLake;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    debugPrint(cartReceiver?.latLang.toString());
    _kLake = CameraPosition(
      target: cartReceiver?.latLang ?? LatLng(0, 0),
      zoom: 15,
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getScreenHeight(context) / 3,
          minWidth: getScreenWidth(context)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    liteModeEnabled: true,
                    myLocationEnabled: true,
                    initialCameraPosition: _kLake,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    // markers: Set<Marker>.of(markers.values),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 45.0,
                      ),
                      child: Icon(Icons.location_on,
                          color: Theme.of(context).primaryColor, size: 50),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MediumTextView(text: cartReceiver?.receiverName ?? ""),
                      BigTextView(text: "EDIT")
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MediumTextView(
                      text:
                          "${cartReceiver?.receiverCountryCode}${cartReceiver?.receiverPhone}"),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                      child: SmallTextView(
                          text: cartReceiver?.receiverAddress ?? ""))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
