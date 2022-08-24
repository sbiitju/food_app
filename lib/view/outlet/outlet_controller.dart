import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../../data/model/category_items_model.dart';
import '../../data/model/outlet_info_model.dart';
import '../../data/repo/base_repo.dart';
import '../../util/ItemModel.dart';

class OutletController extends BaseController {
  var listOfItem = <Item>[].obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  Future<OutletInfoModel> getOutlet(outletId) {
    return _repository.getOutlet(outletId);
  }

  Future<List<CategoryItems>> getCategoryItems(outletId) async {
    List<CategoryItems> list = [];
    return _repository.getCategoryItems(outletId);
  }
}
