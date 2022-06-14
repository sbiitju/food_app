import 'package:flutter/material.dart';
import 'package:food_app/graphql/graphql.dart';
import 'package:food_app/util/function.dart';
import 'package:food_app/view/Splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
          ),
          primarySwatch: Colors.blue,
        ),
      home: GraphQLProvider(
        client: GraphqlClass.client,
        child: SplashScreen(),
      ),
    );
  }
}
