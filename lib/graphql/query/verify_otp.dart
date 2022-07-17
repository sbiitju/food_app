class VerifyOTP{
  String verifyOTP="""
  mutation VerifyOtp(\$phoneNo:PhoneNumber!, \$countryCode:String!, \$deviceUuid:String!, \$otp:String!, \$fcmToken:String) {
    verifyOtp(auth:{phone:\$phoneNo, countryCode:\$countryCode, deviceToken:\$fcmToken, deviceUuid:\$deviceUuid} otp:\$otp) {
        message
        statusCode
        result {
            token
            refreshToken
            expiresAt
        }
    }
}
  """;
}