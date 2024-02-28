import '../../../domain/entities/auth/user_entity.dart';
import 'user_dto.dart';

class AuthResponse {
  String? message;
  UserDto? user;
  String? token;

  AuthResponse({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(dynamic json) {
    return AuthResponse(
      message: json['message'],
      user: json['user'] != null ? UserDto.fromJson(json['user']) : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
      'token': token,
    };
  }

  User toUser() {
    return User(
      name: user?.name,
      email: user?.email,
      role: user?.role,
      token: token,
    );
  }
}
