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
          title: Text("Settings"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                },
                                child: Text(
                                  "English",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.titleSmall,
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
                                },
                                child: Text(
                                  "বাংলা",
                                  style: Theme.of(context).textTheme.titleSmall,
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
                              MaterialButton(
                                onPressed: () {
                                  saveThemeSettings(false);
                                  Get.changeThemeMode(ThemeMode.light);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Light Mode",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  saveThemeSettings(true);
                                  Get.changeThemeMode(ThemeMode.dark);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Dark Mode",
                                  style: Theme.of(context).textTheme.titleSmall,
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
