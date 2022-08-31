import 'package:food_app/data/remote/checout/checkout_data_source.dart';
import 'package:food_app/view/checkout/model/delivery_address_model.dart';
import 'package:food_app/view/checkout/model/order_place_address_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/graphql.dart';
import '../../../graphql/query/getCustomerShoppingCartReceivingAddressesQuery.dart';

class CheckOutDataSourceImp implements CheckOutDataSource {
  @override
  Future<DeliveryAddress> getCustomerShoppingCartAddress() async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
    return ParseOrderPlaceAddress.parseOrderPlaceAddress();
  }
}
