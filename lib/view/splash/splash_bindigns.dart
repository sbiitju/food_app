import 'package:food_app/view/auth/auth_controller.dart';
import 'package:food_app/view/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
