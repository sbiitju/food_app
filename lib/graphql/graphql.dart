import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_app/graphql/query/graphql_query.dart';
import 'package:food_app/util/ItemModel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../get/controller.dart';

class GraphqlClass {
  static HttpLink httpLink = HttpLink("https://api-dev.hungrynaki.com/graphql");
  static Link link = httpLink;
  static ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httpLink));

  GraphQLClient clientToQuery() {
    return GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }

static Future<void> getCountries() async {
  final Controller controller = Get.put(Controller());
  GraphQLClient client = GraphqlClass().clientToQuery();
  QueryResult result = await client.query(QueryOptions(
      document: gql(GraphQlQuery().getItems),
      variables: {'outletId': "5cc7f78009472269fe3ca490"}));
  var check=Items.fromMap(result.data);
  // debugPrint(result.data.toString());
  final list = check.getItems!.result!.items;
  // check.getItems!.result.items

  String responsibleDetails = getPrettyJsonString(result.data);
  // debugPrint("Sithi"+itemsFromJson(responsibleDetails).toString());
  Map<String, dynamic> jsonData =
      json.decode(responsibleDetails) as Map<String, dynamic>;
  // final list =
  //     jsonData["getItems"]["result"]["menuCategories"] as List<dynamic>;
  // debugPrint("Sithi"+list.toString());
  for (var i = 0; i < list!.length; i++) {
    var item = Demo(list[i].meta?.description, list[i].meta?.name);
    controller.demoList.add(item);
    print(item.id);
  }

}

// static Future<void> getCustomerCashBackOffer() async {
//   final PaginationInfo customerOutlet = PaginationInfo(10, 0);
//   final Controller controller = Get.put(Controller());
//   GraphQLClient client = GraphqlClass().clientToQuery();
//   QueryResult result = await client.query(
//       QueryOptions(document: gql(GraphQlQuery().getCustomerCashBackOffer)));
//   String responsibleDetails = getPrettyJsonString(result.data);
//   debugPrint("Test " + result.toString());
// }

static String getPrettyJsonString(Map<String, dynamic>? data) {
  String response = JsonEncoder.withIndent('').convert(data);
  return response;
}

  static Future<void> getReverseGeoCode(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    GraphQLClient client = GraphqlClass().clientToQuery();
    QueryResult result = await client.query(QueryOptions(
        document: gql(GraphQlQuery().getReverseGeoCode),
        variables: {'point': params}));
    // debugPrint("Shahin Bashar" + result.toString());
  }

  static Future<void> getZone(double lat, double lon) async {
    var params = {
      "coordinate": {
        "type": "Point",
        "coordinates": [lat, lon]
      }
    };
    GraphQLClient client = GraphqlClass().clientToQuery();
    QueryResult result = await client.query(QueryOptions(
        document: gql(GraphQlQuery().getZone),
        variables: {'coordinateVar': params}));
    debugPrint("Shahin Bashar" + result.toString());
  }
}
