import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:food_app/data/repo/cart/cart_repo_imp.dart';
import 'package:get/get.dart';

class CartRepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepo>(
      () => CartRepoImp(),
      tag: (CartRepo).toString(),
    );
  }
}
