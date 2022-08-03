import 'package:flutter/material.dart';
import 'package:food_app/view/Splash.dart';
import 'package:food_app/view/auth/auth_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phone_number/phone_number.dart';

import '../view/Home.dart';

var LOGIN_STATUS = "login_status";
var TOKEN = "token";
var getStorage = GetStorage();

Route onGenerateRoute(settings) {
  Widget _nextPage;

  switch (settings.name) {
    case '/':
      _nextPage = SplashScreen();
      break;
    case Home.RouteName:
      _nextPage = Home(LatLng(0, 0));
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

bool checkLoginStatus() {
  var status = getStorage.read(TOKEN) as String?;
  return !(status == null || status.isEmpty);
}

void initialSetUp() {
  getStorage.write(LOGIN_STATUS, "LogIn");
}

Future<bool> isValidateNumber(String number) async {
  PhoneNumberUtil plugin = PhoneNumberUtil();

  RegionInfo region = RegionInfo(name: 'BD', code: '880', prefix: 880);
  return await plugin.validate(number, region.code);
}

Future<void> saveToken(String token) async {
  getStorage.write(TOKEN, token);
}

void changeLoginStatus() {
  getStorage.write(LOGIN_STATUS, "LogIn");
}

Future<String> getToken() async {
  return getStorage.read(TOKEN);
}

Widget loginCheckingDialog(context) {
  return Dialog(
    backgroundColor: Color(0xffffff),
    child: SizedBox(
      height: 350,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 280,
            height: 320,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Center(child: Image.asset("assest/img_login.png")),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Please, Log In!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Hi! Please Login or Sign-Up so that \nwe can serve you",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 300,
              left: 120,
              right: 120,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AuthPage();
                    }));
                  },
                  icon: Icon(
                    Icons.offline_pin_rounded,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    ),
  );
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
