import 'package:food_app/data/remote/data_source_imp.dart';
import 'package:get/get.dart';

import '../data/remote/data_source.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphQlDataSource>(
      () => GraphQlDataSourceImp(),
      tag: (GraphQlDataSource).toString(),
    );
  }
}
