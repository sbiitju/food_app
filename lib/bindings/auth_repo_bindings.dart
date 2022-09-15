import 'package:food_app/data/remote/auth/auth_repo.dart';
import 'package:food_app/data/remote/auth/auth_repo_imp.dart';
import 'package:get/get.dart';

class AuthRepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepo>(
          () => AuthRepoImp(),
      tag: (AuthRepo).toString(),
    );
  }
}
