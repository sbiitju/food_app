import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api/cat_api.dart';
import 'package:food_app/api/cats.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const RouteName = "SplashScreen";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: MaterialButton(
              color: Colors.green,
              child: Text("get Data"),
              onPressed: () async {
                var result = await CatAPI().getCatBreeds();
                var data=catFromJson(result);
                data.forEach((element) {
                  debugPrint(element.description);
                });
                var catMap = json.decode(result);
                print("My Result " + catMap[0].toString());
              },
            ),
          ),
        ),
      ),
    );
  }
}
