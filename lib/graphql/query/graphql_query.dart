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
        restaurant{
          name
        }
        deliveryFee
        meta{
          images{
            cover
            logo
          }
        }
      }
    }
  }
 }
  """;

  String getReverseGeoCode = """
  query reverseGeoCode(\$coordinate: Point!) {
    reverseGeoCode(
      coordinate:\$coordinate
  ){
      message
    statusCode
    result {
      address
      addressComponents{
        house
        road
      }
      area
      areaComponents{
        area
      }
      city
      district
  
    }
 }
 }
  """;

  String getZone = """
 query GetZone (\$coordinate: Point!){
  getZone(coordinate: \$coordinate) {
   message
    statusCode
    result {
      id
      name
      isActive
      serviceArea{
        name
      }
    }
  }
  }
  """;


}
