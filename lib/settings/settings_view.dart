import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_app/util/function.dart';
import 'package:get/get.dart';

import '../get/controller.dart';

class SettingsView extends GetView<Controller> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.settingsText,
              style: Theme.of(context).textTheme.titleSmall),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 65),
              child: Text(
                AppLocalizations.of(context)!.appLanguage,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  saveLanguageSettings(false);
                                  Get.updateLocale(Locale("en"));
                                  Navigator.pop(context);
                                  controller.isBanglaModeOn.value = false;
                                },
                                child: Row(
                                  children: [
                                    Obx(() {
                                      return Radio(
                                        value: false,
                                        groupValue:
                                            controller.isBanglaModeOn.value,
                                        onChanged: (value) {
                                          saveLanguageSettings(false);
                                          Get.updateLocale(Locale("en"));
                                          Navigator.pop(context);
                                          controller.isBanglaModeOn.value =
                                              false;
                                        },
                                      );
                                    }),
                                    Text(
                                      "English",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  saveLanguageSettings(true);
                                  Get.updateLocale(Locale("bn"));
                                  Navigator.pop(context);
                                  controller.isBanglaModeOn.value = true;
                                },
                                child: Row(
                                  children: [
                                    Obx(() {
                                      return Radio(
                                        value: true,
                                        groupValue:
                                            controller.isBanglaModeOn.value,
                                        onChanged: (value) {
                                          saveLanguageSettings(true);
                                          Get.updateLocale(Locale("bn"));
                                          Navigator.pop(context);
                                          controller.isBanglaModeOn.value =
                                              true;
                                        },
                                      );
                                    }),
                                    Text(
                                      "বাংলা",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                width: getScreenWidth(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 65),
                  child: Text(
                    AppLocalizations.of(context)!.changeLanguage,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 65),
              child: Text(
                AppLocalizations.of(context)!.applicationTheme,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MaterialButton(onPressed: () {
                                saveThemeSettings(false);
                                controller.isDarkModeOn.value = false;
                                Get.changeThemeMode(ThemeMode.light);
                                Navigator.pop(context);
                              }, child: Obx(() {
                                return Row(
                                  children: [
                                    Radio(
                                        value: false,
                                        groupValue:
                                            controller.isDarkModeOn.value,
                                        onChanged: (value) {
                                          saveThemeSettings(false);
                                          controller.isDarkModeOn.value = false;
                                          Get.changeThemeMode(ThemeMode.light);
                                          Navigator.pop(context);
                                        }),
                                    Text(
                                      "Light Mode",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                );
                              })),
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(onPressed: () {
                                saveThemeSettings(true);
                                Get.changeThemeMode(ThemeMode.dark);
                                controller.isDarkModeOn.value = true;
                                Navigator.pop(context);
                              }, child: Obx(() {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue:
                                            controller.isDarkModeOn.value,
                                        onChanged: (onChanged) {
                                          saveThemeSettings(true);
                                          Get.changeThemeMode(ThemeMode.dark);
                                          Navigator.pop(context);
                                          controller.isDarkModeOn.value = true;
                                        }),
                                    Text(
                                      "Dark Mode",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                );
                              }))
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                width: getScreenWidth(context),
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 65),
                  child: Text(
                    AppLocalizations.of(context)!.changeTheme,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
