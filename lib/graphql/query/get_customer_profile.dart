class GetCustomerProfile {
  final String getCustomerProfile = """
  query Account{
    getCustomerProfile {
        message
        statusCode
        result {
          id
          name
          phone
          countryCode
          primaryEmail
          avatar
        }
    }
}
  """;
}
