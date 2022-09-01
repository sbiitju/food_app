import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:get/get.dart';

import '../../model/cart/cart.dart';

class CartRepoImp implements CartRepo {
  final CartDataSource _remoteSource =
      Get.find(tag: (CartDataSource).toString());

  @override
  Rx<Cart?> cart = Rx(null);

  @override
  Rx<double> totalAmount = Rx(0.0);

  @override
  Rx<int> totalItem = Rx(0);

  @override
  Future<Cart> getCart() async {
    return _remoteSource
        .getCart("fingerPrint")
        .then((value) => cart.value = value);
  }

  @override
  Future addToCart() {
    return _remoteSource.addToCart();
  }

  @override
  Future getPaymentMethods(double lat, double lon) {
    return _remoteSource.getPaymentMethods(lat, lon);
  }

  @override
  Future getCustomerShoppingCartReceivingAddresses() {
    // TODO: implement getCustomerShoppingCartReceivingAddresses
    throw UnimplementedError();
  }
}
