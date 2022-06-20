import 'package:food_app/get/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(
          () => Controller(),
    );
  }
}
