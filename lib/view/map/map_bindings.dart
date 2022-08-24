import 'package:food_app/view/map/map_controller.dart';
import 'package:get/get.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
