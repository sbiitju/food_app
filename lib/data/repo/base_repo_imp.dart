import 'package:food_app/data/model/outlet_model.dart';
import 'package:food_app/data/repo/base_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../remote/data_source.dart';

class BaseRepoImp implements BaseRepo {
  final GraphQlDataSource _remoteSource =
      Get.find(tag: (GraphQlDataSource).toString());

  @override
  Future<bool> getItems() {
    return _remoteSource.getItems();
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
  Future<List<Outlet>> getHPOutletList(double lat, double lon,int index) {
   return _remoteSource.getHPOutletList(lat, lon,index);
  }
}
