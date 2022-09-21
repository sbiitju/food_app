import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_app/data/model/order_status.dart';
import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/model/profile_model.dart';
import 'package:food_app/data/remote/data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/graphql/query/getCatagorizedItemsQuery.dart';
import 'package:food_app/graphql/query/getOutletQuery.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../graphql/query/get_customer_profile.dart';
import '../../graphql/query/get_running_order_query.dart';
import '../../graphql/query/graphql_query.dart';
import '../../util/ItemModel.dart';
import '../model/area_model.dart';
import '../model/category_items_model.dart';
import '../model/outlet_info_model.dart';
import '../model/parse_response.dart';

class GraphQlDataSourceImp extends BaseDataSource implements GraphQlDataSource {
  @override
  Future<bool> getServiceConfiguration(String versionNumber) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GraphQlQuery().getServiceConfiguration),
        variables: {'versionNumber': "4.1"}));
    debugPrint("ServiceConfig" + result.toString());
    var isSuccess = false;
    try {
      isSuccess =
          (result.data!["getServiceConfiguration"]["statusCode"] == 200);
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  @override
  Future<List<Item>> getItems(String id) async {
    List<Item> listOfItem = <Item>[];
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GraphQlQuery().getItems), variables: {'outletId': id}));
    debugPrint("ServiceConfig$result");
    String responsibleDetails = getPrettyJsonString(result.data);
    Map<String, dynamic> jsonData =
        json.decode(responsibleDetails) as Map<String, dynamic>;
    final list =
        jsonData["getItems"]["result"]["menuCategories"] as List<dynamic>;
    for (var i = 0; i < list.length; i++) {
      var item = Item(list[i]["id"].toString(), list[i]["name"].toString());
      listOfItem.add(item);
    }
    return listOfItem;
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    String response = JsonEncoder.withIndent('').convert(data);
    return response;
  }

  @override
  Future<Area> getReverseGeoCode(double lat, double lon) async {
    // ignore: unused_local_variable
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GraphQlQuery().getReverseGeoCode),
        variables: {
          'coordinate': {
            "type": "Point",
            "coordinates": [lon, lat]
          }
        }));
    var x = ParseResponse(result);
    return x.parseReverseGeoCodeResult();
  }

  @override
  Future<bool> getZone(double lat, double lon) async {
    QueryResult result = await BaseDataSource.client.value
        .query(QueryOptions(document: gql(GraphQlQuery().getZone), variables: {
      'coordinate': {
        "type": "Point",
        "coordinates": [lon, lat]
      }
    }));
    var x = ParseResponse(result);
    return x.parseGetZone();
  }

  @override
  Future<List<Outlet>> getHPOutletList(
      double lat, double lon, int index) async {
    QueryResult result = await BaseDataSource.client.value.query(
        QueryOptions(document: gql(GraphQlQuery().getHPOutletList), variables: {
      "params": {
        "queryName": "getNearestOutlets",
        "coordinate": {
          "type": "Point",
          "coordinates": [lon, lat]
        },
        "pagination": {"limit": 18, "skip": index}
      }
    }));
    debugPrint("HpOutletList $index" + result.toString());
    var x = ParseResponse(result);
    var y = x.parse();
    return y;
  }

  @override
  Future<OutletInfoModel> getOutlet(String outletID) async {
    debugPrint("OutletInfo" + "Got it");
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(OutletQuery().getOutlet),
        variables: {'outletId': outletID}));

    var modifiedResult = ParseResponse(result).parseOutletInfoResult();
    return modifiedResult;
  }

  @override
  Future<List<CategoryItems>> getCategoryItems(String outletId) async {
    QueryResult result = await BaseDataSource.client.value.query(QueryOptions(
        document: gql(GetCategorizedItems().getCategorizedItems),
        variables: {'outletId': outletId}));

    var modifiedResult = ParseResponse(result).parseListOfCategoryItems();
    debugPrint("newCategory" + modifiedResult[0].items[0].itemName);

    return modifiedResult;
  }

  @override
  Future<Profile> getCustomerProfile() async {
    QueryResult result = await BaseDataSource.client.value.query(
        QueryOptions(document: gql(GetCustomerProfile().getCustomerProfile)));
    debugPrint("Profile " + result.data.toString());
    return Profile.parse(result);
  }

  @override
  Future<List<OrderStatus>> getRunningOrder() async {
    final result = await BaseDataSource.client.value
        .query(QueryOptions(document: gql(RunningOrder().getRunningOrder)));
    debugPrint(result.toString());
    return (result.data!["getRunningOrders"]["result"]["orderInfo"]
            as List<dynamic>)
        .map((e) => OrderStatus.parse(e))
        .toList();
  }

  @override
  Stream<List<OrderStatus?>?> subscribeRunningOrder() async* {
    final result = await BaseDataSource.client.value.subscribe(
        SubscriptionOptions(document: gql(RunningOrder().subscriptions)));
  }
}
