import 'package:food_app/view/outlet/outlet_controller.dart';
import 'package:get/get.dart';

class OutletBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutletController>(() => OutletController(), fenix: true);
  }
}
