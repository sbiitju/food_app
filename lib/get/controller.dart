import 'package:flutter/material.dart';
import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:get/get.dart';

import '../util/ItemModel.dart';

class Controller extends GetxController {
  var address = Area("", "", "", "", "").obs;
  List demoList = <Demo>[].obs;
  var checking = false.obs;
  var isServiceAvailable = false.obs;
  var listOfItem = <Item>[].obs;
  var listOutletId = <Outlet>[].obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<bool> getServiceConfiguration() {
    return _repository.getServiceConfiguration("4.1");
  }

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;

  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  void toggleThemeMode(bool isOn) {
    themeMode.value = isOn ? ThemeMode.dark : ThemeMode.light;
  }

  Future addItem() {
    return _repository.addToCart();
  }

  Future<bool> getItems(id) {
    return _repository.getItems(id);
  }

  Future<Area> getReverseGeoCode(lat, lon) {
    _repository.getZone(lat, lon);
    return _repository.getReverseGeoCode(lat, lon);
  }

  bool getZone(lat, lon) {
    _repository.getZone(lat, lon).then((value) => isServiceAvailable(value));
    return isServiceAvailable.value;
  }

  Future<OutletInfoModel> getOutlet(outletId) {
    return _repository.getOutlet(outletId);
  }

  Future<List<Outlet>> getHpOutletList(lat, lon, index) async {
    _repository
        .getHPOutletList(lat, lon, index)
        .then((value) => listOutletId.addAll(value));
    checking(true);
    return listOutletId;
  }

  Future<List<CategoryItems>> getCategoryItems(outletId) async {
    List<CategoryItems> list = [];
    return _repository.getCategoryItems(outletId);
  }
}

class Demo {
  final id;
  final name;

  Demo(this.id, this.name);
}
