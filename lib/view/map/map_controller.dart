import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/area_model.dart';
import '../../data/repo/base_repo.dart';

class MapController extends BaseController {
  var isServiceAvailable = false.obs;
  var address = Area("Loading", "..", "", "", "").obs;
  var latLon = LatLng(0.0, 0.0).obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<bool> getZone(lat, lon) async {
    await _repository
        .getZone(lat, lon)
        .then((value) => isServiceAvailable(value));
    return isServiceAvailable.value;
  }

  Future<Area> getReverseGeoCode(lat, lon) async {
    await _repository.getZone(lat, lon);
    return _repository.getReverseGeoCode(lat, lon);
  }
}
