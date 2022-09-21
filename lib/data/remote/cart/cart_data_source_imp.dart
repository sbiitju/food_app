import 'package:flutter/cupertino.dart';
import 'package:food_app/data/remote/cart/cart_data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/graphql/query/getCustomerShoppingCartReceivingAddressesQuery.dart';
import 'package:food_app/graphql/query/get_cart_query.dart';
import 'package:food_app/graphql/query/get_payment_query.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/cart/model/cart/cart_payment_method.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/add_item/add_item_query.dart';
import '../../../graphql/query/place_order_query.dart';
import '../../../graphql/query/set_delivery_address.dart';
import '../../../graphql/query/set_payment_query.dart';
import '../../../view/cart/model/cart/cart.dart';
import '../../../view/cart/model/order_place_address_model.dart';
import '../../model/item.dart';

class CartDataSourceImp extends BaseDataSource implements CartDataSource {
  @override
  Future<Cart> getCart(String fingerPrint) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCart().getCart),
        variables: {"fingerprint": fingerPrint}));
    debugPrint(result.data.toString());
    saveFingerPrint(result.data!["getCart"]["result"]["fingerprint"]);

    return Cart.parse(result);
  }

  @override
  Future addToCart(Item itemInfo, LatLng latLon, String fingerPrint) async {
    QueryResult result = await BaseDataSource.client.value.query(
        QueryOptions(document: gql(AddItemQuery().addItemQuery), variables: {
      "coordinate": {
        "type": "Point",
        "coordinates": [latLon.longitude, latLon.latitude]
      },
      "item": {
        "fingerprint": fingerPrint,
        "item": {
          "id": itemInfo.id,
          "variant": {"id": itemInfo.variants![0].variantId}
        }
      }
    }));
    saveFingerPrint(
        result.data!["addItem"]["result"]["fingerprint"].toString());
    debugPrint(result.toString());
    getFingerPrint().then((value) => debugPrint(value));
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
    // ignore: unused_local_variable
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
  }

  @override
  Future<List<OrderPlaceAddress>> getCustomerShoppingCartAddress() async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCustomerShoppingCartReceivingAddresses()
            .getCustomerShoppingCartReceivingAddresses)));
    debugPrint("getCustomerShoppingCartAddress" + result.toString());
    return (result.data!["getCustomerShoppingCartReceivingAddresses"]["result"]
            as List<dynamic>)
        .map((e) => OrderPlaceAddress.parse(e))
        .toList();
  }

  @override
  Future<String> placeRegularOrder(String fingerPrint) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(PlaceOrderQuery().placeRegularOrder),
        variables: {"fingerprint": fingerPrint}));
    debugPrint("PlaceOrder" + result.toString());
    return result.data!["placeRegularOrder"]["result"]["orderUid"].toString();
  }

  @override
  Future<List<CartPaymentMethod>> getPaymentMethods(
      double lat, double lon) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetPaymentQuery().getPaymentMethod),
        variables: {
          "coordinate": {
            "type": "Point",
            "coordinates": [lon, lat]
          }
        }));
    debugPrint("Payment Method" + result.toString());
    return (result.data!["getPaymentMethods"]["result"] as List<dynamic>)
        .map((e) => CartPaymentMethod.parse(e))
        .toList();
  }

  @override
  Future setPaymentMethod(String fingerPrint, String paymentType) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(SetPaymentQuery().setPaymentMethod),
        variables: {
          "paymentMethod": {
            "fingerprint": fingerPrint,
            "paymentType": paymentType
          }
        }));
    saveFingerPrint(result.data!["setPaymentMethod"]["result"]["fingerprint"]);
  }

  @override
  Future setDeliveryAddress(
      String fingerPrint, String deliveryAddressId) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(SetDeliveryAddress().setDeliveryAddress),
        variables: {
          "fingerprint": fingerPrint,
          "receivingAddressId": deliveryAddressId
        }));
    saveFingerPrint(
        result.data!["setDeliveryAddress"]["result"]["fingerprint"]);
    debugPrint("SetAddress" + result.toString());
  }
}
