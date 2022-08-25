import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/get/base_controller.dart';
import 'package:get/get.dart';

import '../../data/model/category_items_model.dart';
import '../../data/model/outlet_info_model.dart';
import '../../data/repo/base_repo.dart';
import '../../util/ItemModel.dart';

class OutletController extends BaseController {
  List<Item> listOfItem = <Item>[].obs;
  var outlet = Rx<OutletInfoModel?>(null);
  RxList<CategoryItems> listOfItems = <CategoryItems>[].obs;
  Rx<int> selectedCategoryIndex = 0.obs;
  final scrollController = ScrollController();
  double outletInfoHeight = 252 - kToolbarHeight;
  List<double> breackPoints = [];
  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());

  void getOutlet(outletId) {
    _repository.getOutlet(outletId).then((value) {
      outlet.value = value;
    });
  }

  void getCategoryItems(outletId) async {
    _repository.getCategoryItems(outletId).then((value) {
      listOfItems.value = value;
      scrollController.addListener(() {
        updateBrerackPoint(scrollController.offset);
      });
      createBreackPoints();
    });
  }

  void createBreackPoints() {
    double firstBreackPoint = outletInfoHeight;
    breackPoints.add(firstBreackPoint);
    for (var i = 0; i < listOfItems.length; i++) {
      double breackPoint =
          breackPoints.last + (190 * listOfItems[i].items.length);
      breackPoints.add(breackPoint);
    }
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i <= index; i++) {
        totalItems += listOfItems[i].items.length;
      }
      scrollController.animateTo(outletInfoHeight + (200 * totalItems),
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
    selectedCategoryIndex.value = index;
  }

  void updateBrerackPoint(double offset) {
    for (var i = 0; i < listOfItems.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryIndex != 0)) {
          selectedCategoryIndex.value = 0;
        }
      } else if ((breackPoints[i - 1] <= offset) & (offset < breackPoints[i])) {
        if (selectedCategoryIndex != i) {
          selectedCategoryIndex.value = i;
        }
      }
    }
  }
}
