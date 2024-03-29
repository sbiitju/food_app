import 'package:flutter/material.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:food_app/get/base_controller.dart';
import 'package:food_app/util/function.dart';
import 'package:get/get.dart';

import '../data/model/profile_model.dart';
import '../util/ItemModel.dart';

class Controller extends BaseController {
  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());
  RxBool isDarkModeOn = false.obs;
  RxBool isBanglaModeOn = false.obs;
  RxBool isLogedIn = false.obs;
  Rx<Profile?> profile = Rx(null);

  Controller() {
    getToken().then((value) => isLogedIn.value = value.isNotEmpty);
    isDarkMode().then((value) => isDarkModeOn.value = value);
    isBangla().then((value) => isBanglaModeOn.value = value);
  }

  getProfile() async {
    profile.value = await _repository.getCustomerProfile();
  }

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;

  void toggleThemeMode(bool isOn) {
    themeMode.value = isOn ? ThemeMode.dark : ThemeMode.light;
  }

  Future<List<Item>> getItems(id) {
    return _repository.getItems(id);
  }
}

class Demo {
  final id;
  final name;

  Demo(this.id, this.name);
}
