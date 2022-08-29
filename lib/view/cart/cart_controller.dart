import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo _repository = Get.find(tag: (CartRepo).toString());

  Future addItem() {
    return _repository.addToCart();
  }

  Future getCart(String fingerPrint) {
    return _repository.getCart(fingerPrint);
  }
}
