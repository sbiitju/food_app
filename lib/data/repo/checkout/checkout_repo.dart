import 'package:food_app/view/checkout/model/delivery_address_model.dart';

abstract class CheckOutRepo {
  Future<DeliveryAddress> getCustomerShoppingCartAddress();
}
