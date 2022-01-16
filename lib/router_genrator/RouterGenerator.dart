import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:desktop_app_demo/router_genrator/GenerateRoutePage.dart';
import 'package:desktop_app_demo/screen/LuncherPage.dart';
import 'package:desktop_app_demo/screen/login/login_screen.dart';
import 'package:desktop_app_demo/screen/product/ProductListScreen.dart';
import 'package:desktop_app_demo/screen/register/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.LOGIN_PAGE:
        return GeneratePageRoute(
            widget: const LoginScreen(), routeName: settings.name!);
      case RoutesName.REGISTER_PAGE:
        return GeneratePageRoute(
            widget: const RegisterScreen(), routeName: settings.name!);
      case RoutesName.PRODUCT_LIST_PAGR:
        return GeneratePageRoute(
            widget: const ProductListScreen(), routeName: settings.name!);
      default:
        return GeneratePageRoute(
            widget: const LaunchScreen(), routeName: settings.name!);
    }
  }
}
