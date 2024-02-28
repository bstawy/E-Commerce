import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/server_failure.dart';
import '../../../data/models/requests/login_request.dart';
import '../../../data/models/requests/register_request.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/use_case/login_use_case.dart';
import '../../../domain/use_case/register_use_case.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  final registerFullNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerMobileNumberController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  static final _loginEmailController = TextEditingController();
  static final _loginPasswordController = TextEditingController();

  TextEditingController get loginEmailController => _loginEmailController;

  TextEditingController get loginPasswordController => _loginPasswordController;

  @factoryMethod
  AuthCubit(this.registerUseCase, this.loginUseCase) : super(InitialState());

  Future<void> register() async {
    emit(RegisterLoadingState());

    final RegisterRequest userCredentials = RegisterRequest(
      fullName: registerFullNameController.text,
      email: registerEmailController.text,
      mobilePhone: registerMobileNumberController.text,
      password: registerPasswordController.text,
      confirmPassword: registerConfirmPasswordController.text,
    );

    var user = await registerUseCase.execute(userCredentials);
    user.fold(
      (l) {
        emit(RegisterFailureState(l));
      },
      (r) {
        emit(RegisterSuccessState(r!));
      },
    );
  }

  Future<void> login() async {
    emit(LoginLoadingState());

    final LoginRequest userCredentials = LoginRequest(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );

    var user = await loginUseCase.execute(userCredentials);
    user.fold(
      (l) {
        emit(LoginFailureState(l));
      },
      (r) {
        emit(LoginSuccessState(r!));
      },
    );
  }
}
