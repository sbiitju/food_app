import 'package:food_app/get/controller.dart';
import 'package:get/get.dart';

class MainController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(
      () => Controller(),
    );
  }
}
