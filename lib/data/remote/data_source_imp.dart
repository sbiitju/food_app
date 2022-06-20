import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_app/data/remote/data_source.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../graphql/query/graphql_query.dart';

class GraphQlDataSourceImp extends BaseDataSource implements GraphQlDataSource {
  BaseDataSource client = BaseDataSource();
  @override
  Future<bool> getServiceConfiguration(String versionNumber) async {
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getServiceConfiguration),
        variables: {'versionNumber': "4.1"}));
    debugPrint("ServiceConfig" + result.toString());
    var isSuccess = false;
    try{
      isSuccess = (result.data!["getServiceConfiguration"]["statusCode"] == 200);
    }catch(e){
      isSuccess = false;
    }
    return isSuccess;
  }

  @override
  Future<void> getItems() async {
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getItems),
        variables: {'outletId': "5cc7f78009472269fe3ca490"}));
    debugPrint("ServiceConfig" + result.toString());
    // var check = Items.fromMap(result.data);
    // // debugPrint(result.data.toString());
    // final list = check.getItems!.result!.items;
    // // check.getItems!.result.items
    //
    // String responsibleDetails = getPrettyJsonString(result.data);
    // // debugPrint("Sithi"+itemsFromJson(responsibleDetails).toString());
    // Map<String, dynamic> jsonData =
    //     json.decode(responsibleDetails) as Map<String, dynamic>;
    // // final list =
    // //     jsonData["getItems"]["result"]["menuCategories"] as List<dynamic>;
    // // debugPrint("Sithi"+list.toString());
    // for (var i = 0; i < list!.length; i++) {
    //   var item = Demo(list[i].meta?.description, list[i].meta?.name);
    //   print(item.id);
    // }
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    String response = JsonEncoder.withIndent('').convert(data);
    return response;
    throw UnimplementedError();
  }

  @override
  Future<void> getReverseGeoCode(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    BaseDataSource client = BaseDataSource();
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getReverseGeoCode),
        variables: {'point': params}));
    debugPrint("ServiceConfig" + result.toString());
  }

  @override
  Future<void> getZone(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getZone),
        variables: {'coordinateVar': params}));
    debugPrint("Shahin Bashar" + result.toString());
    debugPrint("ServiceConfig" + result.toString());
  }

  @override
  Future<void> getHPOutletList(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    QueryResult result = await client.clientToQuery().query(QueryOptions(
        document: gql(GraphQlQuery().getHPOutletList),
        variables: {'coordinateVar': params}));
    debugPrint("Shahin Bashar" + result.toString());
    debugPrint("ServiceConfig" + result.toString());
  }
}
