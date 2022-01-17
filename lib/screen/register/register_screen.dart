import 'package:desktop_app_demo/util/colors_constant.dart';
import 'package:desktop_app_demo/utilites/material_button.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF3366FF),
                      Color(0xFF00CCFF),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                      controller: name,
                      cursorColors: ColorsConstant.APP_PRIMARY_COLOR,
                      textStyle: textStyle(Colors.black, FontWeight.w600, 18),
                      hintTextStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 16),
                      placeholderText: 'Enter Your Name'),
                  TextFieldWidget(
                      controller: email,
                      cursorColors: Colors.black,
                      textStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 18),
                      hintTextStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 16),
                      placeholderText: 'Enter Your Email'),
                  TextFieldWidget(
                      controller: password,
                      obscureText: true,
                      cursorColors: Colors.black,
                      textStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 18),
                      hintTextStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 16),
                      placeholderText: 'Enter Password'),
                  TextFieldWidget(
                      obscureText: true,
                      controller: confirmPassword,
                      cursorColors: Colors.black,
                      textStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 18),
                      hintTextStyle: textStyle(ColorsConstant.APP_PRIMARY_COLOR,
                          FontWeight.w600, 16),
                      placeholderText: 'Enter ConfirmPassword'),
                  MaterialButtonWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Register',
                      style: textStyle(Colors.white, FontWeight.w600, 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
