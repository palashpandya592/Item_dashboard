import 'package:desktop_app_demo/Util/SharedPrefenceUtil.dart';
import 'package:desktop_app_demo/route/RouteName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/LoginBloc.dart';
import 'bloc/LoginEvent.dart';
import 'bloc/LoginState.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();

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
                      SizedBox(
                        width: 450,
                        child: TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            hintText: "Enter Your Email ",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          width: 450,
                          child: TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              hintText: "Enter Password ",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: Colors.black,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 450,
                        height: 48,
                        child: MaterialButton(
                          onPressed: () {
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
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.REGISTER_PAGE);
                        },
                        child: const Text(
                          "Do not have an account ? Signup here.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
