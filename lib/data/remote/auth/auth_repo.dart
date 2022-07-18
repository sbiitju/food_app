import 'package:food_app/data/remote/auth/auth_model.dart';

abstract class AuthRepo{
  Future<bool> createOtp(String phoneNumber);
  Future<VerifyResponse> verifyOtp(String phoneNumber,String OTP);
  String getPrettyJsonString(Map<String, dynamic>? data);
}