import 'package:food_app/data/model/outlet_model.dart';

import '../../util/ItemModel.dart';
import '../model/area_model.dart';
import '../model/category_items_model.dart';
import '../model/outlet_info_model.dart';
import '../model/profile_model.dart';

abstract class GraphQlDataSource {
  Future<bool> getServiceConfiguration(String versionNumber);

  Future<OutletInfoModel> getOutlet(String outletId);

  Future<List<CategoryItems>> getCategoryItems(String outletId);

  Future<List<Item>> getItems(String id);

  String getPrettyJsonString(Map<String, dynamic>? data);

  Future<Area> getReverseGeoCode(double lat, double lon);

  Future<bool> getZone(double lat, double lon);

  Future<List<Outlet>> getHPOutletList(double lat, double lon, int index);

  Future<Profile> getCustomerProfile();
}
