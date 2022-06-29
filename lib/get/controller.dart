import 'package:flutter/foundation.dart';
import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../util/ItemModel.dart';

class Controller extends BaseController {
  var address = Area("areaName", "cityName", "districtName", "houseName", "roadName").obs;
  List demoList = <Demo>[].obs;
  var checking = false.obs;
  var isServiceAvailable = false.obs;
  var listOfItem = <Item>[].obs;
  var listOutletId = <Outlet>[].obs;


  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<bool> getServiceConfiguration() {
    _repository.getZone(23.797911, 90.414391);
   return _repository.getServiceConfiguration("4.1");
  }
  Future<bool> getItems(){
    return _repository.getItems();
  }
  Future<Area> getReverseGeoCode(lat,lon){
    _repository.getZone(lat, lon);
    return _repository.getReverseGeoCode(lat, lon);
  }
  bool getZone(lat,lon){
    _repository.getZone(lat, lon).then((value) => isServiceAvailable(value));
    return isServiceAvailable.value;
  }

  Future<List<Outlet>> getHpOutletList(lat,lon,index)async {
     _repository.getHPOutletList(lat, lon,index).then((value) => listOutletId.addAll(value) );
    checking(true);
    return listOutletId;
  }

}

class Demo {
  final id;
  final name;

  Demo(this.id, this.name);
}
