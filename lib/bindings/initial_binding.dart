import 'package:food_app/bindings/remote_source_bindigs.dart';
import 'package:get/get.dart';

import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
  }
}
