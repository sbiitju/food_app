import 'package:food_app/data/remote/checout/checkout_data_source.dart';
import 'package:food_app/data/remote/checout/checkout_data_source_imp.dart';
import 'package:get/get.dart';

class CheckOutDataSourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutDataSource>(() => CheckOutDataSourceImp(),
        tag: (CheckOutDataSource).toString(), fenix: true);
  }
}
