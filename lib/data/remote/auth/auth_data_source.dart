import 'auth_model.dart';

abstract class AuthDataSource{
  Future<bool> createOtp(String phoneNumber);
  Future<VerifyResponse> verifyOtp(String phoneNumber,String OTP);
  String getPrettyJsonString(Map<String, dynamic>? data);
}