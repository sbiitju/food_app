import 'package:food_app/data/remote/auth/auth_repo.dart';
import 'package:get/get.dart';

import '../../data/remote/auth/auth_model.dart';

class AuthController extends GetxController {
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  var showLoginImage = true.obs;
  var showVerifyPage = false.obs;
  var isNumberValidate = false.obs;
  Future<bool> createOtp(phoneNumber)async{
    return await _repository.createOtp(phoneNumber);
  }
  Future<VerifyResponse> verifyOTP(phoneNumber,otp)async{
    return await _repository.verifyOtp(phoneNumber,otp);
  }
}
