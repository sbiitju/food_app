import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../../data/model/category_items_model.dart';
import '../../data/model/outlet_info_model.dart';
import '../../data/repo/base_repo.dart';
import '../../util/ItemModel.dart';

class OutletController extends BaseController {
  List<Item> listOfItem = <Item>[].obs;
  Rx<OutletInfoModel> outlet = OutletInfoModel(
          "", "", "", "", "", "", 0, "", "", [], true, true, "", "0", 0)
      .obs;
  RxList<CategoryItems> listOfItems = <CategoryItems>[].obs;

  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  void getOutlet(outletId) {
    _repository.getOutlet(outletId).then((value) {
      outlet.value = value;
    });
  }

  Future getCategoryItems(outletId) async {
    _repository.getCategoryItems(outletId).then((value) {
      listOfItems.value = value;
    });
  }
}
