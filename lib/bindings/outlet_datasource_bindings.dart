import 'package:food_app/data/remote/outlet/outlet_datasource.dart';
import 'package:food_app/data/remote/outlet/outlet_datasource_imp.dart';
import 'package:get/get.dart';

class OutletDataSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutletDataSource>(() => OutletDataSourceImp(),
        tag: (OutletDataSource).toString(), fenix: true);
  }
}
