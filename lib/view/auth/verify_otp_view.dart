import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/function.dart';
import '../component/login_otp_button.dart';
import 'auth_controller.dart';

class VerifyOtpView extends StatelessWidget {
  final String phoneNumber;
  final Function function;
  var controller = Get.find<AuthController>();

  VerifyOtpView({Key? key, required this.phoneNumber, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpControllerET = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "We have sent SMS to :",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.backgroundColor),
                      ),
                      Text(
                        "+880${phoneNumber.length == 11 ? phoneNumber.substring(1, 11) : "0${phoneNumber}"}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.redAccent),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 10, top: 8, bottom: 8),
                  child: TextFormField(
                    controller: otpControllerET,
                    autofocus: true,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter OTP Here",
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: LoginOtpButton(
                  text: "Submit",
                  color: controller.isSubmitBtnActive.value
                      ? Colors.redAccent
                      : Colors.black26,
                  clickEvenListener: () {
                    if (phoneNumber.length == 11) {
                      controller
                          .verifyOTP(phoneNumber.substring(1, 11),
                              otpControllerET.text)
                          .then((value) {
                        saveToken(value.token);
                        controller.isSubmitBtnActive.value = false;
                        controller.showLoginImage.value = true;
                        controller.showVerifyPage.value = false;
                        controller.getProfile();
                        controller.isLogedIn.value = true;
                        function();
                      });
                    } else if (phoneNumber.length == 10) {
                      controller
                          .verifyOTP(phoneNumber, otpControllerET.text)
                          .then((value) {
                        saveToken(value.token);
                        controller.isSubmitBtnActive.value = false;
                        controller.showLoginImage.value = true;
                        controller.showVerifyPage.value = false;
                        function();
                      });
                    } else {
                      Get.snackbar("Failed", "Something is wrong",
                          snackStyle: SnackStyle.GROUNDED);
                    }
                    debugPrint(otpControllerET.text);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
