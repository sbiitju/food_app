import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_app/settings/app_theme.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/initial_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("en"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialBinding: InitialBinding(),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}
