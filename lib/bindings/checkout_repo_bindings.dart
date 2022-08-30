import 'package:food_app/data/repo/checkout/checkout_repo.dart';
import 'package:food_app/data/repo/checkout/checkout_repo_imp.dart';
import 'package:get/get.dart';

class CheckOutRepoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutRepo>(() => CheckOutRepoImp(),
        tag: (CheckOutRepo).toString(), fenix: true);
  }
}
