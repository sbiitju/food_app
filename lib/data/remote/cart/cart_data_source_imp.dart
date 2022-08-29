import 'package:flutter/cupertino.dart';
import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/graphql/query/getCustomerShoppingCartReceivingAddressesQuery.dart';
import 'package:food_app/graphql/query/get_cart_query.dart';
import 'package:food_app/graphql/query/get_payment_query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/add_item/add_item_query.dart';

class CartDataSourceImp extends BaseDataSource implements CartDataSource {
  @override
  Future getCart(String fingerPrint) async {
    QueryResult result = await clientToQuery().query(QueryOptions(
        document: gql(GetCart().getCart), variables: {"fingerprint": ""}));
    debugPrint("GetCart" + result.toString());
  }

  @override
  Future addToCart() async {
    QueryResult result = await clientToQuery().query(QueryOptions(
        document: gql(AddItemQuery().addItemQuery),
        variables: const {
          "coordinate": {
            "type": "Point",
            "coordinates": [90.4078, 23.7925]
          },
          "item": {
            "fingerprint": "ngdhds",
            "item": {"id": "5ca4ad2db19d90e0ad9a6eac"}
          }
        }));
    debugPrint("AddToCart" + result.data.toString());
  }

  @override
  Future getPaymentMethods(double lat, double lon) async {
    QueryResult result = await clientToQuery().query(
        QueryOptions(document: gql(GetPaymentQuery().getPayment), variables: {
      "coordinate": {
        "type": "Point",
        "coordinates": [lon, lat]
      }
    }));
  }

  @override
  Future getCustomerShoppingCartReceivingAddresses() async {
    QueryResult result = await clientToQuery().query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
  }
}
