class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String mobilePhone;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.mobilePhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'password': password,
      'rePassword': confirmPassword,
      'phone': mobilePhone,
    };
  }
}
