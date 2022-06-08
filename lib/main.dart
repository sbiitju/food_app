import 'package:flutter/material.dart';
import 'package:food_app/view/Home.dart';
import 'package:food_app/view/Splash.dart';
import 'package:food_app/view/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>const SplashScreen(),
        '/second': (context)=>const Home(),
        ThirdClass.routeName:(context)=>ThirdClass()
      },
    );
  }
}


