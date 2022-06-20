import 'package:food_app/data/repo/base_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../remote/data_source.dart';

class BaseRepoImp implements BaseRepo {
  final GraphQlDataSource _remoteSource =
      Get.find(tag: (GraphQlDataSource).toString());

  @override
  Future<void> getItems() {
    return _remoteSource.getItems();
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    return _remoteSource.getPrettyJsonString(data);
  }

  @override
  Future<void> getReverseGeoCode(double lat, double lon) {
    return _remoteSource.getReverseGeoCode(lat, lon);
  }

  @override
  Future<bool> getServiceConfiguration(String versionNumber) {
    return _remoteSource.getServiceConfiguration(versionNumber);
  }

  @override
  Future<void> getZone(double lat, double lon) {
    return _remoteSource.getZone(lat, lon);
  }

  @override
  Future<void> getHPOutletList(double lat, double lon) {
   return _remoteSource.getHPOutletList(lat, lon);
  }
}
