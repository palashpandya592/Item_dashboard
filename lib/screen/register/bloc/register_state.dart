import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class RegisterState extends Equatable {
  final bool? isSuccessLogin;
  final bool? isLoading;
  final bool? isName;
  final bool? validEmail;
  final bool? validPassword;
  final bool? validConfirmPassword;
  final bool? validGender;
  final bool? birthDate;
  final String? gender;
  final String? password;

  RegisterState copyWith({
    bool? isSuccessLogin,
    bool? isLoading,
    bool? isName,
    bool? validEmail,
    bool? validPassword,
    bool? validConfirmPassword,
    bool? validGender,
    bool? birthDate,
    String? gender,
    String? password,
  }) {
    return RegisterState(
      isSuccessLogin: isSuccessLogin ?? this.isSuccessLogin,
      isLoading: isLoading ?? this.isLoading,
      isName: isName ?? this.isName,
      validEmail: validEmail ?? this.validEmail,
      validPassword: validPassword ?? this.validPassword,
      validConfirmPassword: validConfirmPassword ?? this.validConfirmPassword,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      password: password ?? password,
      validGender: validGender ?? validGender,
    );
  }

  const RegisterState({
    this.isSuccessLogin,
    this.isLoading = true,
    this.isName = true,
    this.validEmail = true,
    this.validPassword = true,
    this.validConfirmPassword = true,
    this.birthDate = true,
    this.gender,
    this.validGender = false,
    this.password,
  });

  @override
  List<Object?> get props => [
        isSuccessLogin,
        isLoading,
        isName,
        validEmail,
        validPassword,
        validConfirmPassword,
        birthDate,
        gender,
        password,
      ];
}
