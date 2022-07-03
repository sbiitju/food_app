import 'package:food_app/data/model/outlet_model.dart';

abstract class BaseRepo{
  Future<bool> getServiceConfiguration(String versionNumber);

  Future<bool> getItems(String id);

  String getPrettyJsonString(Map<String, dynamic>? data);

  Future<Area> getReverseGeoCode(double lat, double lon);

  Future<bool> getZone(double lat, double lon);
  Future<List<Outlet>> getHPOutletList(double lat, double lon,int index);
}