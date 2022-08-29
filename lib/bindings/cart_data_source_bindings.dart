import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:get/get.dart';

import '../data/remote/cart/cart_data_source_imp.dart';

class CartDataSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartDataSource>(
      () => CartDataSourceImp(),
      tag: (CartDataSource).toString(),
    );
  }
}
