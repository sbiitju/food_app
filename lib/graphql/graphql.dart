import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BaseDataSource {
  static HttpLink httpLink = HttpLink("https://api-dev.hungrynaki.com/graphql");
  static Link link = httpLink;
  static ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httpLink));

  GraphQLClient clientToQuery() {
    return GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }

}
