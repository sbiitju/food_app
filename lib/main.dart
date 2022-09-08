import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_app/settings/app_theme.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/initial_binding.dart';

void main() async {
  bool? languageStatus;
  bool? themeStatus;

  await GetStorage.init();
  await isBangla().then((value) => languageStatus = value);
  await isDarkMode().then((value) => themeStatus = value);
  runApp(MyApp(languageStatus: languageStatus!, themeStatus: themeStatus!));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languageStatus, required this.themeStatus, Key? key})
      : super(key: key);
  final bool languageStatus;
  final bool themeStatus;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: languageStatus ? Locale("bn") : Locale("en"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialBinding: InitialBinding(),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      themeMode: themeStatus ? ThemeMode.dark : ThemeMode.light,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}
