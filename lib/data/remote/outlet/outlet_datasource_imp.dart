import 'package:flutter/cupertino.dart';
import 'package:food_app/data/remote/outlet/outlet_datasource.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql/graphql.dart';
import '../../../graphql/query/update_item_query.dart';

class OutletDataSourceImp implements OutletDataSource {
  @override
  Future removeItem(String fingerPrint, CartItem cartItem) async {
    print("RemoveItem${cartItem.itemId} ${cartItem.variants?[0].variantId}");
    QueryResult result = await BaseDataSource.client.value.mutate(
        MutationOptions(
            document: gql(UpdateItemQuery().removeItemQuery),
            variables: {
          "itemInput": {
            "fingerprint": fingerPrint,
            "item": {
              "id": cartItem.itemId,
              "variant": {"id": cartItem.variants?[0].variantId}
            }
          }
        }));
    debugPrint("Remove" + result.toString());
  }

  @override
  Future resetCart() async {
    QueryResult result =
        await BaseDataSource.client.value.mutate(MutationOptions(
      document: gql(UpdateItemQuery().removeItemQuery),
    ));
  }

  @override
  Future subtractItem(String fingerPrint, CartItem cartItem) async {
    print("SubtractItem${cartItem.itemId} ${cartItem.variants?[0].variantId}");
    QueryResult result = await BaseDataSource.client.value.mutate(
        MutationOptions(
            document: gql(UpdateItemQuery().subtractItemQuery),
            variables: {
          "itemInput": {
            "fingerprint": fingerPrint,
            "item": {
              "id": cartItem.itemId,
              "variant": {"id": cartItem.variants?[0].variantId}
            }
          }
        }));
    debugPrint("Subtraction" + result.toString());
  }
}
