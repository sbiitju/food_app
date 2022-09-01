import 'package:food_app/data/remote/checout/checkout_data_source.dart';
import 'package:food_app/data/repo/checkout/checkout_repo.dart';
import 'package:food_app/view/checkout/model/delivery_address_model.dart';
import 'package:food_app/view/checkout/model/payment_ui_model.dart';
import 'package:get/get.dart';

class CheckOutRepoImp implements CheckOutRepo {
  final CheckOutDataSource _remoteSource =
      Get.find(tag: (CheckOutDataSource).toString());

  @override
  Future<DeliveryAddress> getCustomerShoppingCartAddress() {
    return _remoteSource.getCustomerShoppingCartAddress();
  }

  @override
  Future<List<PaymentUiModel>> getPaymentMethods(double lat, double lon) =>
      _remoteSource.getPaymentMethods(lat, lon);
}
