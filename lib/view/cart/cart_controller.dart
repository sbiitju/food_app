import 'package:get/get.dart';

import '../../data/repo/base_repo.dart';

class CartController extends GetxController {
  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future addItem() {
    return _repository.addToCart();
  }
}
