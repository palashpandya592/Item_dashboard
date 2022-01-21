import 'package:desktop_app_demo/Util/shared_prefence_util.dart';
import 'package:desktop_app_demo/api/register_api.dart';
import 'package:desktop_app_demo/model/register_request.dart';
import 'package:desktop_app_demo/screen/register/bloc/register_event.dart';
import 'package:desktop_app_demo/screen/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  String? password;
  final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();

  RegisterBloc() : super(const RegisterState()) {
    on<UserRegisterEvent>(_registerUser);
    on<NameChangeEvent>(_nameValid);
    on<EmailChangeEvent>(_emailValid);
    on<PasswordChangeEvent>(_passwordValid);
    on<ConfirmPasswordChangeEvent>(_confirmPasswordValid);
    on<BirthDateChangeEvent>(_birthDate);
    on<GenderChangeEvent>(_gender);
    on<FilePickerEvent>(_filePicker);
  }

  void _registerUser(
      UserRegisterEvent event, Emitter<RegisterState> emit) async {
    if (event.name.isNotEmpty &&
        state.validEmail == true &&
        state.validConfirmPassword == true &&
        state.validPassword == true &&
        event.gender.isNotEmpty &&
        event.birthDate.isNotEmpty) {
      emit(state.copyWith(
        isSuccessLogin: false,
        isLoading: false,
        validGender: false,
      ));
      RegisterAPI registerAPI = RegisterAPI();
      RegisterRequest registerRequest = RegisterRequest();
      registerRequest.name = event.name;
      registerRequest.email = event.email;
      registerRequest.password = event.password;
      registerRequest.confirmPassword = event.confirmPassword;
      registerRequest.gender = event.gender;
      registerRequest.birthDate = event.birthDate;
      if (event.file != null) {
        // register with profile
        var response = await registerAPI.registerAPIWithImage(
            registerRequest, event.file!);
        if (response != null) {
          emit(state.copyWith(
            isSuccessLogin: true,
            isLoading: true,
          ));
        } else {
          emit(state.copyWith(
            isSuccessLogin: false,
            isLoading: false,
          ));
        }
      } else {
        // register without profile
        var response = await registerAPI.registerAPIWithoutImage(
          registerRequest,
        );
        if (response != null) {
          emit(state.copyWith(
            isSuccessLogin: true,
            isLoading: true,
          ));
        } else {
          emit(state.copyWith(
            isSuccessLogin: false,
            isLoading: false,
          ));
        }
      }
    } else {
      emit(state.copyWith());
    }
  }

  void _emailValid(EmailChangeEvent event, Emitter<RegisterState> emit) async {
    RegExp email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (event.email != null && email.hasMatch(event.email!)) {
      emit(state.copyWith(
        validEmail: true,
      ));
    } else {
      emit(state.copyWith(
        validEmail: false,
      ));
    }
  }

  void _passwordValid(
      PasswordChangeEvent event, Emitter<RegisterState> emit) async {
    if (event.password != null && event.password!.length >= 8) {
      password = event.password;
      emit(state.copyWith(
        validPassword: true,
      ));
    } else {
      emit(state.copyWith(
        validPassword: false,
      ));
    }
  }

  void _confirmPasswordValid(
      ConfirmPasswordChangeEvent event, Emitter<RegisterState> emit) {
    if (event.password == password) {
      emit(state.copyWith(
        validConfirmPassword: true,
      ));
    } else {
      emit(state.copyWith(
        validConfirmPassword: false,
      ));
    }
  }

  void _nameValid(NameChangeEvent event, Emitter<RegisterState> emit) async {
    if (event.name != null) {
      emit(state.copyWith(
        isName: true,
      ));
    } else {
      emit(state.copyWith(
        isName: false,
      ));
    }
  }

  void _birthDate(
      BirthDateChangeEvent event, Emitter<RegisterState> emit) async {
    if (event.birthday != null && event.birthday!.length >= 6) {
      emit(state.copyWith(
        birthDate: true,
      ));
    } else {
      emit(state.copyWith(
        birthDate: false,
      ));
    }
  }

  void _gender(GenderChangeEvent event, Emitter<RegisterState> emit) async {
    if (event.gender != null) {
      emit(state.copyWith(
        gender: event.gender,
        validGender: false,
      ));
    } else {
      emit(state.copyWith(
        validGender: true,
      ));
    }
  }

  void _filePicker(FilePickerEvent event, Emitter<RegisterState> emit) async {
    if (event.file != null) {}
  }
}
