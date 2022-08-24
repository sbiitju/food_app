import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../../data/model/area_model.dart';
import '../../data/repo/base_repo.dart';

class SplashController extends BaseController {
  var address = Area("", "", "", "", "").obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<bool> getServiceConfiguration() {
    return _repository.getServiceConfiguration("4.1");
  }

  Future<Area> getReverseGeoCode(lat, lon) {
    _repository.getZone(lat, lon);
    return _repository.getReverseGeoCode(lat, lon);
  }
}
