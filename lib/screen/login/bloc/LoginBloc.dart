import 'package:desktop_app_demo/Util/SharedPrefenceUtil.dart';
import 'package:desktop_app_demo/api/LoginApi.dart';
import 'package:desktop_app_demo/model/LoginRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();

  LoginBloc() : super(const LoginState()) {
    on<UserLoginEvent>(_loginUser);
  }

  void _loginUser(UserLoginEvent event, Emitter<LoginState> emit) async {
    RegExp email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (event.email != null &&
        email.hasMatch(event.email!) &&
        event.password!.length >= 8) {
      emit(state.copyWith(isSuccessLogin: false, isLoading: true));
      LoginAPI loginAPI = LoginAPI();
      LoginRequest loginRequest = LoginRequest();
      loginRequest.email = event.email;
      loginRequest.password = event.password;
      final user = await loginAPI.loginAPI(loginRequest);
      if (user != null) {
        sharedPreferenceUtil.setString(SharedPreferenceUtil.TOKEN, user.token);
        emit(state.copyWith(
            isSuccessLogin: true, isLoading: true, isFailedLogin: false));
      } else {
        emit(state.copyWith(
            isSuccessLogin: false, isLoading: false, isFailedLogin: true));
      }
      emit(state.copyWith(isSuccessLogin: false, isLoading: false));
    } else {
      emit(state.copyWith(
          isSuccessLogin: false, isLoading: false, isFailedLogin: false));
      print('please check email & password');
    }
  }
}
