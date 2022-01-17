
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
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Center(
          child: Column(
            children: [

              TextFieldWidget(
                  controller: name,
                  cursorColors: Colors.black,
                  textStyle: textStyle(Colors.black, FontWeight.w600, 18),
                  hintTextStyle: textStyle(Colors.black, FontWeight.w600, 16),
                  placeholderText: 'Enter Your Name'),
              TextFieldWidget(
                  controller: email,
                  cursorColors: Colors.black,
                  textStyle: textStyle(Colors.black, FontWeight.w600, 18),
                  hintTextStyle: textStyle(Colors.black, FontWeight.w600, 16),
                  placeholderText: 'Enter Your Email'),
              TextFieldWidget(
                  controller: password,
                  cursorColors: Colors.black,
                  textStyle: textStyle(Colors.black, FontWeight.w600, 18),
                  hintTextStyle: textStyle(Colors.black, FontWeight.w600, 16),
                  placeholderText: 'Enter Password'),
              TextFieldWidget(
                  controller: name,
                  cursorColors: Colors.black,
                  textStyle: textStyle(Colors.black, FontWeight.w600, 18),
                  hintTextStyle: textStyle(Colors.black, FontWeight.w600, 16),
                  placeholderText: 'Enter ConfirmPassword'),
              MaterialButtonWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Register',
                  style: textStyle(Colors.black, FontWeight.w600, 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
