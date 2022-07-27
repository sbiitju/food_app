import 'package:food_app/data/model/outlet_model.dart';

abstract class GraphQlDataSource {
  Future<bool> getServiceConfiguration(String versionNumber);

  Future<OutletInfoModel> getOutlet(String outletId);

  Future<List<CategoryItems>> getCategoryItems(String outletId);

  Future<bool> getItems(String id);

  String getPrettyJsonString(Map<String, dynamic>? data);

  Future<Area> getReverseGeoCode(double lat, double lon);

  Future<bool> getZone(double lat, double lon);

  Future addToCart();

  Future<List<Outlet>> getHPOutletList(double lat, double lon, int index);
}
