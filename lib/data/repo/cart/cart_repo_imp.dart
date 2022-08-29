import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:get/get.dart';

class CartRepoImp implements CartRepo {
  final CartDataSource _remoteSource =
      Get.find(tag: (CartDataSource).toString());

  @override
  Future getCart(String fingerPrint) {
    return _remoteSource.getCart(fingerPrint);
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
