class CreateOtpQuery {
  String createOtp = """
mutation CreateOtp(\$phoneNo:PhoneNumber!, \$countryCode:String!, \$fcmToken:String, \$deviceUuid:String!,\$device:CreateDeviceInput!) {
    createOtp(auth:{phone:\$phoneNo, countryCode:\$countryCode, deviceToken:\$fcmToken, deviceUuid:\$deviceUuid} device:\$device) {
        message,
        statusCode
    }
}
  """;
}
