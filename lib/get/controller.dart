import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  List demoList=<Demo>[].obs;
}
class Demo{
  final id;
  final name;

  Demo(this.id, this.name);

}
