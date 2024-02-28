part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class InitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final User user;

  RegisterSuccessState(this.user);
}

class RegisterFailureState extends AuthState {
  final ServerFailure serverFailure;

  RegisterFailureState(this.serverFailure);
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final User user;

  LoginSuccessState(this.user);
}

class LoginFailureState extends AuthState {
  final ServerFailure serverFailure;

  LoginFailureState(this.serverFailure);
}
