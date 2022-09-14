import 'package:flutter/material.dart';
import 'package:food_app/view/auth/auth_view.dart';
import 'package:food_app/view/cart/model/invoice_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phone_number/phone_number.dart';

import '../view/cart/model/item_list_model.dart';
import '../view/home/home_view.dart';
import '../view/splash/splash_view.dart';

var TOKEN = "token";
var FINGERPRINT = "fingerprint";
var LANGUAGE = "language";
var THEME = "theme";
var getStorage = GetStorage();

Route onGenerateRoute(settings) {
  Widget _nextPage;

  switch (settings.name) {
    case '/':
      _nextPage = SplashScreen();
      break;
    case HomeView.RouteName:
      _nextPage = HomeView(LatLng(0, 0), "");
      break;
    default:
      _nextPage = Container();
  }

  /// Return with page transaction animation
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => _nextPage,
      transitionsBuilder: (_, anim1, __, child) {
        var begin = (settings.name != HomeView.RouteName)
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

Future<bool> checkLoginStatus() async {
  bool status = false;
  await getToken().then((value) => status = value.isNotEmpty);
  return status;
}

Future<bool> isValidateNumber(String number) async {
  PhoneNumberUtil plugin = PhoneNumberUtil();

  RegionInfo region = RegionInfo(name: 'BD', code: '880', prefix: 880);
  return await plugin.validate(number, region.code);
}

Future<void> saveToken(String token) async {
  getStorage.write(TOKEN, token);
}

Future<void> saveFingerPrint(String fingerPrint) async {
  getStorage.write(FINGERPRINT, fingerPrint);
}

Future<String> getFingerPrint() async {
  final fingerPrint = getStorage.read(FINGERPRINT) ?? "";
  return fingerPrint;
}

Future<void> removeToken() async {
  getStorage.remove(TOKEN);
}

Future<void> saveLanguageSettings(bool status) async {
  getStorage.write(LANGUAGE, status);
}

Future<void> saveThemeSettings(bool status) async {
  getStorage.write(THEME, status);
}

Future<String> getToken() async {
  final token = getStorage.read(TOKEN) ?? "";
  return token;
}

Future<bool> isDarkMode() async {
  final status = getStorage.read(THEME) ?? false;
  return status;
}

Future<bool> isBangla() async {
  final status = getStorage.read(LANGUAGE) ?? false;
  return status;
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
                      return AuthPage(
                        function: () {
                          Navigator.pop(context);
                        },
                      );
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

List<ItemListModel> getDemoItemList() {
  var list = <ItemListModel>[];
  list.add(ItemListModel(itemName: "Shahin Bashar", itemPrice: "200"));
  list.add(ItemListModel(itemName: "Shahin Bashar", itemPrice: "200"));
  list.add(ItemListModel(itemName: "Shahin Bashar", itemPrice: "200"));
  list.add(ItemListModel(itemName: "Shahin Bashar", itemPrice: "200"));
  list.add(ItemListModel(itemName: "Shahin Bashar", itemPrice: "200"));
  return list;
}

List<InvoiceModel> getDemoInvoiceList() {
  var list = <InvoiceModel>[];
  list.add(InvoiceModel(costName: "Shahin Bashar", costAmount: "200"));
  list.add(InvoiceModel(costName: "Shahin Bashar", costAmount: "200"));
  list.add(InvoiceModel(costName: "Shahin Bashar", costAmount: "200"));
  return list;
}

showBottomDialog(BuildContext context, Widget widget) {
  showModalBottomSheet(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      context: context,
      builder: (context) {
        return widget;
      });
}
