abstract class GraphQlDataSource {
  Future<bool> getServiceConfiguration(String versionNumber);

  Future<void> getItems();

  String getPrettyJsonString(Map<String, dynamic>? data);

  Future<void> getReverseGeoCode(double lat, double lon);

  Future<void> getZone(double lat, double lon);

  Future<void> getHPOutletList(double lat, double lon);
}
