import 'package:food_app/data/remote/auth/auth_repo.dart';
import 'package:get/get.dart';

import '../../data/remote/auth/auth_model.dart';

class AuthController extends GetxController {
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  var showLoginImage = true.obs;
  var showVerifyPage = false.obs;
  var isNumberValidate = false.obs;
  var isSubmitBtnActive = false.obs;
  var isAgreeBtnChecked = false.obs;
  var isVerifyMeBtnActive = false.obs;

  Future<bool> createOtp(phoneNumber) async {
    return await _repository.createOtp(phoneNumber);
  }

  Future<VerifyResponse> verifyOTP(phoneNumber, otp) async {
    VerifyResponse verifyResponse =
        await _repository.verifyOtp(phoneNumber, otp);
    return verifyResponse;
  }
}
