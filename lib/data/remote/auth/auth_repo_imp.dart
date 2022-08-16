import 'package:food_app/data/remote/auth/auth_data_source.dart';
import 'package:food_app/data/remote/auth/auth_model.dart';
import 'package:food_app/data/remote/auth/auth_repo.dart';
import 'package:get/get.dart';

class AuthRepoImp implements AuthRepo {
  final AuthDataSource _authDataSource =
      Get.find(tag: (AuthDataSource).toString());

  @override
  Future<bool> createOtp(String phoneNumber) {
    return _authDataSource.createOtp(phoneNumber);
  }

  @override
  String getPrettyJsonString(Map<String, dynamic>? data) {
    return _authDataSource.getPrettyJsonString(data);
  }

  @override
  Future<VerifyResponse> verifyOtp(String phoneNumber, String OTP) {
    return _authDataSource.verifyOtp(phoneNumber, OTP);
  }
}
