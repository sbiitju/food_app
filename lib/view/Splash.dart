import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../get/controller.dart';
import '../util/geo_location.dart';
import 'map.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Position position;


  final Controller controller = Get.put(Controller());
  @override
  void initState() {
    super.initState();
    GeoLocation().determinePosition().then((value){
      position = value;
    });
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, MapSample.RouteName,arguments: position));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset('assest/splash.json'),
      ),
    );
  }
}
