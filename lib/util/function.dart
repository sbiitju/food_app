import 'package:flutter/cupertino.dart';
import 'package:food_app/view/Splash.dart';

import '../view/Home.dart';
import '../view/map.dart';

Route onGenerateRoute(settings) {
  Widget _nextPage;

  switch (settings.name) {
    case '/':
      _nextPage = SplashScreen();
      break;
    case Home.RouteName:
      _nextPage = const Home();
      break;
    case MapSample.RouteName:
      _nextPage = const MapSample();
      break;
    default:
      _nextPage = Container();
  }

  /// Return with page transaction animation
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => _nextPage,
      transitionsBuilder: (_, anim1, __, child) {
        var begin = (settings.name != Home.RouteName)
            ? const Offset(1.0, 0.0)
            : const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInSine;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: anim1.drive(tween),
          child: child,
        );
      });
}
