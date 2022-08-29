import 'package:flutter/material.dart';
import 'package:food_app/view/component/login_otp_button.dart';
import 'package:get/get.dart';

import '../../util/function.dart';
import '../component/customize_textview.dart';
import 'auth_controller.dart';

// ignore: must_be_immutable
class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  var controller = Get.find<AuthController>();
  final TextEditingController phoneControllerET = TextEditingController();
  final TextEditingController otpControllerET = TextEditingController();

  Widget loginFirstView() => Column(
        children: [
          Image.asset("assest/img_login.png"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => !controller.showVerifyPage.value
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    controller.showLoginImage.value
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.25,
                            child: loginFirstView())
                        : Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.showLoginImage.value = true;
                                controller.showVerifyPage.value = false;
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter Your Phone Number",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                                "Verify Your account through phone number. We will send you a one-time verification code"),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: TextFormField(
                                    initialValue: "+880",
                                    autofocus: false,
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width / 5) -
                                      40,
                                  child: TextFormField(
                                    autofocus: false,
                                    textAlign: TextAlign.center,
                                    controller: phoneControllerET,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Phone Number",
                                    ),
                                    onTap: () {
                                      controller.showLoginImage.value = false;
                                    },
                                    onChanged: (value) => {
                                      if ((phoneControllerET.text.length ==
                                              10 ||
                                          phoneControllerET.text.length == 11))
                                        {
                                          controller.isNumberValidate.value =
                                              true
                                        }
                                      else
                                        {
                                          controller.isNumberValidate.value =
                                              false
                                        }
                                    },
                                  ),
                                )
                              ],
                            ),
                            !controller.showLoginImage.value
                                ? Row(
                                    children: [
                                      Checkbox(
                                          value: controller
                                              .isAgreeBtnChecked.value,
                                          onChanged: (value) {
                                            controller.isAgreeBtnChecked.value =
                                                value!;
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                          "I agree with terms & Conditions of Hungrynaki")
                                    ],
                                  )
                                : SizedBox(),
                            !controller.showLoginImage.value
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 200,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: LoginOtpButton(
                                          text: "Verify Me",
                                          clickEvenListener: controller
                                                  .isNumberValidate.value
                                              ? () {
                                                  if (phoneControllerET
                                                          .text.length ==
                                                      11) {
                                                    controller.createOtp(
                                                        phoneControllerET.text
                                                            .substring(1, 11));
                                                    controller.showVerifyPage
                                                        .value = true;
                                                  } else if (phoneControllerET
                                                          .text.length ==
                                                      10) {
                                                    controller.createOtp(
                                                        phoneControllerET.text);
                                                    controller.showVerifyPage
                                                        .value = true;
                                                  } else {
                                                    Get.snackbar("Failed",
                                                        "Please Input a valid phone Number",
                                                        snackStyle: SnackStyle
                                                            .GROUNDED);
                                                  }
                                                }
                                              : null,
                                          color: checkVerifyMeBtnStatus()
                                              ? Colors.redAccent
                                              : Colors.black26,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: goToLoginPage,
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "We have sent SMS to :",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "+880${phoneControllerET.text.length == 11 ? phoneControllerET.text.substring(1, 11) : "0${phoneControllerET.text}"}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.redAccent),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 100, top: 8, bottom: 8),
                        child: TextFormField(
                          controller: otpControllerET,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: "Enter OTP Here",
                          ),
                        ),
                      ),
                      resendOTPandEditMobileNumber()
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: LoginOtpButton(
                        text: "Submit",
                        color: controller.isSubmitBtnActive.value
                            ? Colors.redAccent
                            : Colors.black26,
                        clickEvenListener: () {
                          debugPrint(otpControllerET.text);
                          controller
                              .verifyOTP(
                                  phoneControllerET.text.substring(1, 11),
                                  otpControllerET.text)
                              .then((value) {
                            saveToken(value.token);
                            controller.isSubmitBtnActive.value = false;
                            controller.showLoginImage.value = true;
                            controller.showVerifyPage.value = false;
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ),
                  )
                ],
              )),
      ),
    );
  }

  Widget resendOTPandEditMobileNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          const CustomizedTextView(
            text: "ResendOTP",
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            child: const CustomizedTextView(text: "Edit Mobile Number"),
            onTap: () {
              goToLoginPage();
            },
          )
        ],
      ),
    );
  }

  void goToLoginPage() {
    FocusManager.instance.primaryFocus?.unfocus();
    controller.showLoginImage.value = true;
    controller.showVerifyPage.value = false;
  }

  bool checkVerifyMeBtnStatus() {
    return controller.isNumberValidate.value &&
        controller.isAgreeBtnChecked.value;
  }
}
