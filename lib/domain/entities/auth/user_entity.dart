class User {
  final String? name;
  final String? email;
  final String? role;
  final String? token;

  User({
    this.name,
    this.email,
    this.role,
    this.token,
  });

  factory User.fromJson(dynamic json) {
    return User(
      name: json['name'],
      email: json['email'],
      role: json['role'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}
