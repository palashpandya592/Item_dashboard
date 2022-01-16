import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool? isSuccessLogin;
  final bool? isLoading;
  final bool? isFailedLogin;

  LoginState copyWith(
      {bool? isSuccessLogin, bool? isLoading, bool? isFailedLogin}) {
    return LoginState(
        isSuccessLogin: isSuccessLogin ?? this.isSuccessLogin,
        isLoading: isLoading ?? this.isLoading,
        isFailedLogin: isFailedLogin ?? this.isFailedLogin);
  }

  const LoginState({
    this.isSuccessLogin,
    this.isLoading = false,
    this.isFailedLogin = false,
  });

  @override
  List<Object?> get props => [isSuccessLogin, isLoading];
}
