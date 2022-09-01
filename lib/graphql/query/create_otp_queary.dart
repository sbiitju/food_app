class CreateOtpQuery {
  String createOtp = """
  mutation PlaceRegularOrder(\$fingerprint:String!, \$device:CreateDeviceInput!, \$currentLocation:Point!) {
    placeRegularOrder(fingerprint:\$fingerprint, device:\$device, currentLocation:\$currentLocation) {
        message
        statusCode
        result {
            orderUid
            status
        }
    }
}
  """;
}
