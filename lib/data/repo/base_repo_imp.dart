import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/model/profile_model.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:get/get.dart';

import '../../util/ItemModel.dart';
import '../model/area_model.dart';
import '../model/category_items_model.dart';
import '../model/outlet_info_model.dart';
import '../remote/data_source.dart';

class BaseRepoImp implements BaseRepo {
  final GraphQlDataSource _remoteSource =
      Get.find(tag: (GraphQlDataSource).toString());

  @override
  Future<List<Item>> getItems(String id) {
    return _remoteSource.getItems(id);
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    return _remoteSource.getPrettyJsonString(data);
  }

  @override
  Future<Area> getReverseGeoCode(double lat, double lon) {
    return _remoteSource.getReverseGeoCode(lat, lon);
  }

  @override
  Future<bool> getServiceConfiguration(String versionNumber) {
    return _remoteSource.getServiceConfiguration(versionNumber);
  }

  @override
  Future<bool> getZone(double lat, double lon) {
    return _remoteSource.getZone(lat, lon);
  }

  @override
  Future<List<Outlet>> getHPOutletList(double lat, double lon, int index) {
    return _remoteSource.getHPOutletList(lat, lon, index);
  }

  @override
  Future<OutletInfoModel> getOutlet(String outletID) {
    return _remoteSource.getOutlet(outletID);
  }

  @override
  Future<List<CategoryItems>> getCategoryItems(String outletId) {
    return _remoteSource.getCategoryItems(outletId);
  }

  @override
  Future<Profile> getCustomerProfile() {
    return _remoteSource.getCustomerProfile();
  }
}
