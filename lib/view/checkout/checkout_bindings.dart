import 'package:food_app/view/checkout/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(() => CheckOutController(), fenix: true);
  }
}
