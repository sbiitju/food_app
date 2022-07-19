import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Obx(() => Wrap(
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
                if (!controller.showVerifyPage.value)
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
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
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
                                  maxLength: 11,
                                  controller: phoneControllerET,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Phone Number",
                                  ),
                                  onTap: () {
                                    controller.showLoginImage.value = false;
                                  },
                                ),
                              )
                            ],
                          ),
                          !controller.showLoginImage.value
                              ? Center(
                                  child: MaterialButton(
                                    color:!controller.isNumberValidate.value
                                        ? Colors.red:Colors.white60 ,
                                    onPressed: controller.isNumberValidate.value
                                        ? () {
                                            if (phoneControllerET.text.length ==
                                                11) {
                                              controller.createOtp(
                                                  phoneControllerET.text
                                                      .substring(1, 11));
                                              controller.showVerifyPage.value =
                                                  true;
                                            } else if (phoneControllerET
                                                    .text.length ==
                                                10) {
                                              controller.createOtp(
                                                  phoneControllerET.text);
                                              controller.showVerifyPage.value =
                                                  true;
                                            } else {
                                              Get.snackbar("Failed",
                                                  "Please Input a valid phone Number",
                                                  snackStyle:
                                                      SnackStyle.GROUNDED);
                                            }
                                          }
                                        : null,
                                    child: Text("Verify Me"),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      Text(
                          "We have sent SMS to :\n+88${phoneControllerET.text}"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: otpControllerET,
                          decoration: InputDecoration(
                            hintText: "OTP",
                          ),
                        ),
                      ),
                      Center(
                        child: MaterialButton(onPressed: () {
                          controller
                              .verifyOTP(
                                  phoneControllerET.text.substring(1, 11),
                                  otpControllerET.text)
                              .then((value) => Get.snackbar(
                                  "Result", value.token.toString()));
                        }),
                      )
                    ],
                  ),
              ],
            )),
      ),
    );
  }
}
