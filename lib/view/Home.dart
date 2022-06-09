import 'dart:async';

import 'package:flutter/material.dart';


import '../get/controller.dart';
import 'map.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const  RouteName = "SplashScreen";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MapSample();
  }
}
