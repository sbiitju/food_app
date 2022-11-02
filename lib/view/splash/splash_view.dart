import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/map/map_view.dart';
import 'package:food_app/view/splash/splash_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../get/controller.dart';
import '../../util/geo_location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Position? position;
  bool isApiCallCompleted = false;

  final SplashController controller = Get.find<SplashController>();
  final Controller base_controller = Get.find<Controller>();

  @override
  void initState() {
    base_controller.getProfile();
    super.initState();
    controller.getServiceConfiguration().then((value) {
      isApiCallCompleted = value;
      tryNavigateToNextScreen();
    });

    GeoLocation().determinePosition().then((value) {
      position = value;
      controller
          .getReverseGeoCode(position?.latitude, position?.longitude)
          .then((value) => controller.address.value = value);
      tryNavigateToNextScreen();
    });
  }

  void tryNavigateToNextScreen() {
    var check = (!(position == null) && isApiCallCompleted);
    debugPrint(check.toString());
    if (check == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MapView(position!)),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: getScreenWidth(context),
      height: getScreenHeight(context),
      child: Center(
        child: Lottie.asset('assest/splash.json'),
      ),
    );
  }
}
