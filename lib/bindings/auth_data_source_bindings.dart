import 'package:food_app/data/remote/auth/auth_data_source.dart';
import 'package:food_app/data/remote/auth/auth_data_source_imp.dart';
import 'package:get/get.dart';

class AuthDataSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
          () => AuthDataSourceImp(),
      tag: (AuthDataSource).toString(),
    );
  }
}
