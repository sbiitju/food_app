import 'package:flutter/cupertino.dart';
import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/graphql/query/getCustomerShoppingCartReceivingAddressesQuery.dart';
import 'package:food_app/graphql/query/get_cart_query.dart';
import 'package:food_app/graphql/query/get_payment_query.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/add_item/add_item_query.dart';
import '../../../graphql/query/place_order_query.dart';
import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/delivery_address_model.dart';
import '../../../view/cart/model/order_place_address_model.dart';
import '../../../view/cart/model/payment_ui_model.dart';
import '../../model/item.dart';

class CartDataSourceImp extends BaseDataSource implements CartDataSource {
  @override
  Future<Cart> getCart(String fingerPrint) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCart().getCart),
        variables: {"fingerprint": fingerPrint}));
    debugPrint("GetCart" + result.toString());
    return CartParse.parseGetCart();
  }

  @override
  Future addToCart(Item itemInfo, LatLng latLon) async {
    QueryResult result = await BaseDataSource.client.value.query(
        QueryOptions(document: gql(AddItemQuery().addItemQuery), variables: {
      "coordinate": {
        "type": "Point",
        "coordinates": [latLon.longitude, latLon.latitude]
      },
      "item": {
        "fingerprint": "db4ef760-c223-47bb-b8fe-1704ed2775c6",
        "item": {
          "id": itemInfo.id,
          "variant": {"id": itemInfo.variants![0].variantId}
        }
      }
    }));
    debugPrint("AddToCart" + result.data.toString());
  }

  // @override
  // Future getPaymentMethods(double lat, double lon) async {
  //   QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
  //       document: gql(GetPaymentQuery().getPaymentMethod),
  //       variables: {
  //         "coordinate": {
  //           "type": "Point",
  //           "coordinates": [lon, lat]
  //         }
  //       }));
  // }

  @override
  Future getCustomerShoppingCartReceivingAddresses() async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
  }

  @override
  Future<DeliveryAddress> getCustomerShoppingCartAddress() async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
    return ParseOrderPlaceAddress.parseOrderPlaceAddress();
  }

  @override
  Future<List<PaymentUiModel>> getPaymentMethod(double lat, double lon) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetPaymentQuery().getPaymentMethod),
        variables: {
          "coordinate": {
            "type": "Point",
            "coordinates": [lon, lat]
          }
        }));
    return PaymentUiModel.parsingPaymentUiModelList(result);
  }

  @override
  Future<String> placeRegularOrder(
      double lat, double lon, String fingerPrint) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(PlaceOrderQuery().placeRegularOrder),
        variables: {
          "coordinate": {
            "type": "Point",
            "coordinates": [lon, lat]
          }
        }));
    debugPrint("PlaceOrder" + result.toString());
    return result.toString();
  }
}
