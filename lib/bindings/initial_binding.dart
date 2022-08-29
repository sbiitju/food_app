import 'package:food_app/bindings/auth_data_source_bindings.dart';
import 'package:food_app/bindings/auth_repo_bindings.dart';
import 'package:food_app/bindings/cart_data_source_bindings.dart';
import 'package:food_app/bindings/cart_repo_bindings.dart';
import 'package:food_app/bindings/main_controller_bindings.dart';
import 'package:food_app/bindings/remote_source_bindigs.dart';
import 'package:food_app/view/auth/auth_bindings.dart';
import 'package:food_app/view/cart/cart_bindings.dart';
import 'package:food_app/view/checkout/checkout_bindings.dart';
import 'package:food_app/view/home/home_bindings.dart';
import 'package:food_app/view/map/map_bindings.dart';
import 'package:food_app/view/outlet/outlet_bindings.dart';
import 'package:get/get.dart';

import '../view/splash/splash_bindigns.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    AuthDataSourceBindings().dependencies();
    AuthRepositoryBindings().dependencies();
    AuthBindings().dependencies();
    MainController().dependencies();
    CartBindings().dependencies();
    CheckoutBindings().dependencies();
    SplashBindings().dependencies();
    MapBindings().dependencies();
    HomeBindings().dependencies();
    OutletBindings().dependencies();
    CartRepositoryBindings().dependencies();
    CartDataSourceBindings().dependencies();
  }
}
