class GraphQlQuery {
  String getCountries = """
  query country{
  countries{
  isoCode
  name
  }
  }
  """;
  String getItems = """
  query MenuCategory(\$outletId: ObjectId!) {
  getItems(
  pagination: {},
  filter: {
  menuCategoryId: null
  },
  outletId: \$outletId
  ) {
  message
  statusCode
  result {
  menuCategories{
  id
  name
  }
  items{
  meta{
  name
  description
  images{
  cover
  }
  }
  }
  }
  }
  }
  """;
  String getCustomerOutlets = """
 query getCustomerOutlets() {
  getCustomerOutlets(
  pagination: {},
  filter: {}
  ) {
  message
  statusCode
  result {
    outlets{
      id
    }
  }
  }
  }
  """;
  String getCustomerCashBackOffer = """
 query CustomerCashbackOffer {
    getCustomerCashbackOffer() {
        message
        statusCode
        result {
            meta {
                title
                image {
                    cover
                }
            }
            isActive
        }
    }
}
""";
 String getServiceConfiguration = """ 
 query getServiceConfiguration(\$versionNumber: String) {
 getServiceConfiguration(versionNumber: \$versionNumber)
 {
  message
  statusCode
  result {
  termsAndCondition
  homePageSections{
  queryName
  type
  title
  minItem
  }
  configApiCallIntervalTime
  faq
  legal
  privacyPolicy
  }
  }
  }
""";

String getHPOutletList = """
  query getHPOutletList(\$params: HPOutletListInputParam!) {
    getHPOutletList(
      params:\$params
  ){
    message
    statusCode
    result{
      outlets{
        id
        rating
        totalRating
        deliveryFee
        dealTitles
        meta {
          name
          images{
          cover
          logo
          }
        }
        restaurant{
          name
        }
      }
    }
  }
 }
  """;

  String getReverseGeoCode = """
  query reverseGeoCode(\$point: Point!) {
    reverseGeoCode(
      coordinate:\$point
  ){
    message
    statusCode
    result{
      address
    
  }
 }
 }
  """;

  String getZone = """
 query GetZone (\$coordinateVar:Point!){
  getZone(coordinate: \$coordinateVar) {
  message
  statusCode
  result {
  name
  }
  }
  }
  """;


}
