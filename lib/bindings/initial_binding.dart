import 'package:food_app/bindings/auth_data_source_bindings.dart';
import 'package:food_app/bindings/auth_repo_bindings.dart';
import 'package:food_app/bindings/remote_source_bindigs.dart';
import 'package:food_app/view/auth/auth_bindings.dart';
import 'package:get/get.dart';

import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    AuthDataSourceBindings().dependencies();
    AuthRepositoryBindings().dependencies();
    AuthBindings().dependencies();
  }
}
