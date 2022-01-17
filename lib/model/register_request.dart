class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? image;

  RegisterRequest(
      {this.name, this.email, this.password, this.confirmPassword, this.image});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        'image': image,
      };
}
