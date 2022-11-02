import 'package:food_app/data/repo/outlet/outlet_repo.dart';
import 'package:food_app/data/repo/outlet/outlet_repo_imp.dart';
import 'package:get/get.dart';

class OutletRepoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutletRepo>(() => OutletRepoImp(),
        tag: (OutletRepo).toString(), fenix: true);
  }
}
