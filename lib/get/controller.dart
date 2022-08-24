import 'package:flutter/material.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

class Controller extends BaseController {
  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;

  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  void toggleThemeMode(bool isOn) {
    themeMode.value = isOn ? ThemeMode.dark : ThemeMode.light;
  }

  Future<bool> getItems(id) {
    return _repository.getItems(id);
  }
}

class Demo {
  final id;
  final name;

  Demo(this.id, this.name);
}
