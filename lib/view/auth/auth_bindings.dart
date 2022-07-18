import 'package:food_app/view/auth/auth_controller.dart';
import 'package:food_app/view/auth/auth_view.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}
