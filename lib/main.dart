import 'package:flutter/material.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/Splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'bindings/initial_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initialSetUp();
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
        ),
        primarySwatch: Colors.blue,
      ),
      home: GraphQLProvider(
        client: BaseDataSource.client,
        child: const SplashScreen(),
      ),
    );
  }
}
