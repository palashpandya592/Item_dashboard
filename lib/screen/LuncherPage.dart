import 'dart:async';

import 'package:desktop_app_demo/Util/SharedPrefenceUtil.dart';
import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key,this.child}) : super(key: key);
  final Widget? child;

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    print("inside _LaunchScreen");
    Timer(const Duration(seconds: 1), onClose);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void onClose() async {
    final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();
    String? token =
        await sharedPreferenceUtil.getString(SharedPreferenceUtil.TOKEN);
    Navigator.pop(context);
    print("Token : ${token}");
    if (token != null) {
      Navigator.pushNamed(context, RoutesName.PRODUCT_LIST_PAGR);
    } else {
      Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
    }
  }
}
