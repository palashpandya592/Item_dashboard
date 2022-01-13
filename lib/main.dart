import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:desktop_app_demo/router_genrator/Router_Generator.dart';
import 'package:desktop_app_demo/screen/Luncher_Page.dart';
import 'package:desktop_app_demo/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

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
      builder: (context, child) => HomePage(child: child!),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.LOGIN_PAGE,
    );
  }
}
