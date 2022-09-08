import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get/controller.dart';

class SettingsView extends GetView<Controller> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Light Mode"),
            Switch(value: false, onChanged: (value) {}),
            Text("Dark Mode")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("English"),
            Switch(
                value: controller.isBangla.value,
                onChanged: (value) {
                  controller.isBangla.value = !controller.isBangla.value;
                  Get.updateLocale(Locale("en"));
                }),
            Text("বাংলা")
          ],
        ),
      ],
    ));
  }
}
