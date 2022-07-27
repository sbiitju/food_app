import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../util/function.dart';
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
                              icon: Icon(Icons.arrow_back),
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
                            const Text("Easy Login with Phone Number"),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width / 5) -
                                      40,
                                  child: TextFormField(
                                    autofocus: false,
                                    textAlign: TextAlign.center,
                                    controller: phoneControllerET,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Phone Number",
                                    ),
                                    onTap: () {
                                      controller.showLoginImage.value = false;
                                    },
                                    onChanged: (value) => {
                                      if (phoneControllerET.text.length == 10 ||
                                          phoneControllerET.text.length == 11)
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
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 200,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: MaterialButton(
                                          color:
                                              controller.isNumberValidate.value
                                                  ? Colors.redAccent
                                                  : Colors.white,
                                          onPressed: controller
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
                                          child: Container(
                                              width: 250,
                                              height: 45,
                                              color: controller
                                                      .isNumberValidate.value
                                                  ? Colors.redAccent
                                                  : Colors.white70,
                                              child: Center(
                                                  child: Text("Verify Me"))),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.showLoginImage.value = true;
                              controller.showVerifyPage.value = false;
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              "We have sent SMS to :\n+88${phoneControllerET.text}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: PinFieldAutoFill(
                            controller: otpControllerET,
                            codeLength: 4,
                            autoFocus: true,
                            cursor: Cursor(
                                color: Colors.black,
                                width: 2,
                                height: 22,
                                enabled: true,
                                fadeDuration: Duration(microseconds: 2000),
                                radius: Radius.circular(20)),
                            enableInteractiveSelection: true,
                            decoration: UnderlineDecoration(
                              obscureStyle: ObscureStyle(isTextObscure: false),
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              colorBuilder:
                                  FixedColorBuilder(Colors.deepOrange),
                            ),
                            onCodeChanged: (code) {
                              if (code!.length == 4) {
                                controller.isSubmitBtnActive.value = true;
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: MaterialButton(
                          onPressed: () {
                            debugPrint(otpControllerET.text);
                            controller
                                .verifyOTP(
                                    phoneControllerET.text.substring(1, 11),
                                    otpControllerET.text)
                                .then((value) {
                              saveToken(value.token);
                              changeLoginStatus();
                              controller.isSubmitBtnActive.value = false;
                              controller.showLoginImage.value = true;
                              controller.showVerifyPage.value = false;
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Submit"),
                          color: controller.isSubmitBtnActive.value
                              ? Colors.redAccent
                              : Colors.white30,
                        ),
                      ),
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
