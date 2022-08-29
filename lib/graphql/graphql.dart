import 'package:flutter/cupertino.dart';
import 'package:food_app/util/function.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BaseDataSource {
  static HttpLink httpLink = HttpLink("https://api-dev.hungrynaki.com/graphql");
  static AuthLink authLink = AuthLink(
    headerKey: "authorization",
    getToken: () async {
      final token = await getToken();
      debugPrint("BaseDataSource");
      return 'Bearer $token}';
    },
  );
  static Link link = authLink.concat(httpLink);
  static ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: link));
}
