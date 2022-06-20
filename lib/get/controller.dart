import 'package:flutter/foundation.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

class Controller extends BaseController {
  List demoList = <Demo>[].obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<bool> getServiceConfiguration() {
    _repository.getZone(23.797911, 90.414391);
    _repository.getHPOutletList(23.797911, 90.414391);
    _repository.getReverseGeoCode(23.797911, 90.414391);
   return _repository.getServiceConfiguration("4.1");
  }
}

class Demo {
  final id;
  final name;

  Demo(this.id, this.name);
}
