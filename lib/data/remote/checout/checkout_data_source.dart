import 'package:food_app/view/checkout/model/delivery_address_model.dart';

import '../../../view/checkout/model/payment_ui_model.dart';

abstract class CheckOutDataSource {
  Future<DeliveryAddress> getCustomerShoppingCartAddress();

  Future<List<PaymentUiModel>> getPaymentMethods(double lat, double lon);

  Future<String> placeRegularOrder(double lat, double lon, String fingerPrint);
}
