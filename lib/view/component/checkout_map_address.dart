import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/cart_component/big_textview.dart';
import 'package:food_app/view/cart/cart_component/medium_text_view.dart';
import 'package:food_app/view/cart/cart_component/small_text_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../checkout/model/delivery_address_model.dart';

class CheckOutMapHead extends StatelessWidget {
  final DeliveryAddress deliveryAddress;

  CheckOutMapHead({Key? key, required this.deliveryAddress}) : super(key: key);
  late CameraPosition _kLake;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    _kLake = CameraPosition(
      target: deliveryAddress.latLng,
      zoom: 14.5,
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: getScreenHeight(context) / 4,
          minWidth: getScreenWidth(context)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kLake,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                // markers: Set<Marker>.of(markers.values),
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
                      MediumTextView(text: deliveryAddress.name),
                      BigTextView(text: "EDIT")
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MediumTextView(text: deliveryAddress.number),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(child: SmallTextView(text: deliveryAddress.address))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
