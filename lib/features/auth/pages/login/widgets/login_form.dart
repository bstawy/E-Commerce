import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/validation_service.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/custom_material_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../manager/auth_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          CustomInputField(
            title: "E-mail address",
            customTextField: CustomTextField(
              controller: authCubit.loginEmailController,
              hint: "Enter your e-mail address",
              validator: (value) {
                return ValidationService.validateEmail(value);
              },
            ),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "Password",
            customTextField: CustomTextField(
              controller: authCubit.loginPasswordController,
              hint: "Enter your password",
              isPassword: true,
              maxLines: 1,
              validator: (value) {
                return ValidationService.validatePassword(value);
              },
            ),
          ),
          SizedBox(height: 56.h),
          CustomMaterialButton(
            title: "Login",
            backgroundColor: Colors.white,
            onClicked: () {
              if (_loginFormKey.currentState!.validate()) {
                authCubit.login();
              }
            },
          ),
        ],
      ),
    );
  }
}
