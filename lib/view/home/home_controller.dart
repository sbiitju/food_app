import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../../data/model/outlet_model.dart';
import '../../data/repo/base_repo.dart';
import '../../data/repo/cart/cart_repo.dart';

class HomeController extends BaseController {
  var listOutletId = <Outlet>[].obs;
  var checking = false.obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());
  final CartRepo cartRepository = Get.find(tag: (CartRepo).toString());

  Future<List<Outlet>> getHpOutletList(lat, lon, index) async {
    _repository
        .getHPOutletList(lat, lon, index)
        .then((value) => listOutletId.addAll(value));
    checking(true);
    return listOutletId;
  }
}
