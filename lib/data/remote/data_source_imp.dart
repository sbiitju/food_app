import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/remote/data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/graphql/query/create_otp_queary.dart';
import 'package:food_app/graphql/query/getCatagorizedItemsQuery.dart';
import 'package:food_app/graphql/query/getOutletQuery.dart';
import 'package:food_app/graphql/query/verify_otp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../get/controller.dart';
import '../../graphql/query/graphql_query.dart';
import '../../util/ItemModel.dart';

class GraphQlDataSourceImp extends BaseDataSource implements GraphQlDataSource {
  BaseDataSource client = BaseDataSource();

  @override
  Future<bool> getServiceConfiguration(String versionNumber) async {
    QueryResult result = await client.clientToQuery().query(QueryOptions(
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
  Future<bool> getItems(String id) async {
    Controller controller = Controller();
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getItems), variables: {'outletId': id}));
    debugPrint("ServiceConfig$result");
    String responsibleDetails = getPrettyJsonString(result.data);
    Map<String, dynamic> jsonData =
        json.decode(responsibleDetails) as Map<String, dynamic>;
    final list =
        jsonData["getItems"]["result"]["menuCategories"] as List<dynamic>;
    for (var i = 0; i < list.length; i++) {
      var item = Item(list[i]["id"].toString(), list[i]["name"].toString());
      controller.listOfItem.add(item);
    }
    return list.isNotEmpty;
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    String response = JsonEncoder.withIndent('').convert(data);
    return response;
  }

  @override
  Future<Area> getReverseGeoCode(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    BaseDataSource client = BaseDataSource();
    QueryResult result = await client.clientToQuery().query(QueryOptions(
            document: gql(GraphQlQuery().getReverseGeoCode),
            variables: {
              'coordinate': {
                "type": "Point",
                "coordinates": [lon, lat]
              }
            }));
    var x = ParseHpOutletListResponse(result);
    return x.parseReverseGeoCodeResult();
  }

  @override
  Future<bool> getZone(double lat, double lon) async {
    QueryResult result = await client
        .clientToQuery()
        .query(QueryOptions(document: gql(GraphQlQuery().getZone), variables: {
          'coordinate': {
            "type": "Point",
            "coordinates": [lon, lat]
          }
        }));
    var x = ParseHpOutletListResponse(result);
    return x.parseGetZone();
  }

  @override
  Future<List<Outlet>> getHPOutletList(
      double lat, double lon, int index) async {
    QueryResult result = await client.clientToQuery().query(QueryOptions(
            document: gql(GraphQlQuery().getHPOutletList),
            variables: {
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
    var x = ParseHpOutletListResponse(result);
    var y = x.parse();
    return y;
  }

  @override
  Future<OutletInfoModel> getOutlet(String outletID) async {
    Controller controller = Controller();
    debugPrint("OutletInfo" + "Got it");
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(OutletQuery().getOutlet),
        variables: {'outletId': outletID}));
    var modifiedResult =
        ParseHpOutletListResponse(result).parseOutletInfoResult();
    return modifiedResult;
  }

  @override
  Future<List<CategoryItems>> getCategoryItems(String outletId) async {
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GetCategorizedItems().getCategorizedItems),
        variables: {'outletId': outletId}));
    var modifiedResult =
        ParseHpOutletListResponse(result).parseListOfCategoryItems();
    return modifiedResult;
  }


}
