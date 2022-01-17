import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {


  @override
  List<Object> get props => [];
}
  class UserLoginEvent extends LoginEvent{
    final String? email;
    final String? password;

    UserLoginEvent({this.email, this.password});
  }