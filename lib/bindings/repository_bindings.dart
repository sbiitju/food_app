import 'package:food_app/data/repo/base_repo.dart';
import 'package:food_app/data/repo/base_repo_imp.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseRepo>(
      () => BaseRepoImp(),
      tag: (BaseRepo).toString(),
    );
  }
}
