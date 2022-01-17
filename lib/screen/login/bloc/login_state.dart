import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool? isSuccessLogin;
  final bool? isLoading;
  final bool? isFailedLogin;
  final bool? validEmail;
  final bool? validPassword;

  LoginState copyWith(
      {bool? isSuccessLogin,
      bool? isLoading,
      bool? isFailedLogin,
      bool? validEmail,
      bool? validPassword}) {
    return LoginState(
      isSuccessLogin: isSuccessLogin ?? this.isSuccessLogin,
      isLoading: isLoading ?? this.isLoading,
      isFailedLogin: isFailedLogin ?? this.isFailedLogin,
      validEmail: validEmail ?? this.validEmail,
      validPassword: validPassword ?? this.validPassword,
    );
  }

  const LoginState({
    this.isSuccessLogin,
    this.isLoading = false,
    this.isFailedLogin = false,
    this.validEmail = true,
    this.validPassword = true,
  });

  @override
  List<Object?> get props =>
      [isSuccessLogin, isLoading, isFailedLogin, validEmail, validPassword];
}
