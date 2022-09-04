import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/data/repo/cart/cart_repo.dart';
import 'package:get/get.dart';

import '../../../view/cart/model/delivery_address_model.dart';
import '../../../view/cart/model/payment_ui_model.dart';
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
  Future getCustomerShoppingCartReceivingAddresses() {
    // TODO: implement getCustomerShoppingCartReceivingAddresses
    throw UnimplementedError();
  }

  @override
  Future<DeliveryAddress> getCustomerShoppingCartAddress() {
    return _remoteSource.getCustomerShoppingCartAddress();
  }

  @override
  Future<List<PaymentUiModel>> getPaymentMethod(double lat, double lon) =>
      _remoteSource.getPaymentMethod(lat, lon);

  @override
  Future<String> placeRegularOrder(double lat, double lon, String fingerPrint) {
    return _remoteSource.placeRegularOrder(lat, lon, fingerPrint);
  }
}
