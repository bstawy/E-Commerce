class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({
    this.name,
    this.email,
    this.role,
  });

  factory UserDto.fromJson(dynamic json) {
    return UserDto(
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
