import 'package:food_app/data/remote/outlet/outlet_datasource.dart';
import 'package:food_app/view/cart/model/cart/cart_item.dart';
import 'package:get/get.dart';

import '../../../util/function.dart';
import 'outlet_repo.dart';

class OutletRepoImp implements OutletRepo {
  final OutletDataSource _remoteSource =
      Get.find(tag: (OutletDataSource).toString());

  @override
  Future removeItem(CartItem cartItem) async {
    String? fingerPrint = await getFingerPrint();
    return _remoteSource.removeItem(fingerPrint, cartItem);
  }

  @override
  Future resetCart() {
    return _remoteSource.resetCart();
  }

  @override
  Future subtractItem(CartItem cartItem) async {
    String? fingerPrint = await getFingerPrint();
    return _remoteSource.subtractItem(fingerPrint, cartItem);
  }
}
