import 'package:desktop_app_demo/route/route_name.dart';
import 'package:desktop_app_demo/utilites/material_button.dart';
import 'package:desktop_app_demo/utilites/style_extension.dart';
import 'package:desktop_app_demo/utilites/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state.isSuccessLogin == true) {
            Navigator.pushNamed(context, RoutesName.PRODUCT_LIST_PAGR);
            _toastMessage('Success Full Login');
          }
          if (state.isFailedLogin == true) {
            _toastMessage('Failed Login');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          controller: email,
                          cursorColors: Colors.black,
                          textStyle:
                              textStyle(Colors.black, FontWeight.w600, 18),
                          hintTextStyle:
                              textStyle(Colors.black, FontWeight.w600, 16),
                          placeholderText: 'Enter Your Email'),
                      TextFieldWidget(
                          controller: password,
                          cursorColors: Colors.black,
                          textStyle:
                              textStyle(Colors.black, FontWeight.w600, 18),
                          hintTextStyle:
                              textStyle(Colors.black, FontWeight.w600, 16),
                          placeholderText: 'Enter Your Email'),
                      MaterialButtonWidget(
                        onTap: () {
                          context.read<LoginBloc>().add(UserLoginEvent(
                              email: email.text, password: password.text));
                        },
                        child: state.isLoading == true
                            ? const SizedBox(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                ),
                              )
                            : Text(
                                'Login',
                                style: textStyle(
                                    Colors.black, FontWeight.w600, 18),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.REGISTER_PAGE);
                        },
                        child: Text(
                          "Do not have an account ? Signup here.",
                          style: textStyle(Colors.black, FontWeight.w500, 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.blue);
  }
}
