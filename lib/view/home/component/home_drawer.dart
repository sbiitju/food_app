import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_app/get/controller.dart';
import 'package:food_app/settings/settings_view.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/auth/auth_view.dart';
import 'package:get/get.dart';

import '../../../data/model/profile_model.dart';

class HomeDrawer extends GetView<Controller> {
  final Profile profile;

  HomeDrawer({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Drawer(
          width: 200,
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: controller.isLogedIn.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(profile.profileImageUrl)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(profile.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Text(profile.mobileNumber,
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                Text(profile.email,
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          )
                        : Center(
                            child: MaterialButton(
                              child: Text("Login/Sign Up"),
                              onPressed: () => Get.off(AuthPage(
                                function: () {
                                  Navigator.pop(context);
                                },
                              )),
                            ),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Theme.of(context).dividerColor,
                    )),
                    child: ListTile(
                      title: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.settings),
                          Text(
                            AppLocalizations.of(context)!.settingsText,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )),
                      onTap: () {
                        Get.to(SettingsView());
                      },
                    ),
                  ),
                ],
              ),
              controller.isLogedIn.value
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: getScreenWidth(context),
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Theme.of(context).dividerColor,
                            )),
                            height: 50,
                            child: Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      removeToken();
                                      Get.to(AuthPage(
                                        function: () {
                                          controller.isLogedIn.value = false;
                                          Navigator.pop(context);
                                        },
                                      ));
                                    },
                                    child: Text("Log Out")))),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ));
  }
}
