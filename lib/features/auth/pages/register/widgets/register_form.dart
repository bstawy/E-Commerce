import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/validation_service.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/custom_material_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../manager/auth_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  static final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          CustomInputField(
            title: "Full Name",
            customTextField: CustomTextField(
                controller: authCubit.registerFullNameController,
                hint: "Enter your full name",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("You must enter your name");
                  }
                  return null;
                }),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "E-mail address",
            customTextField: CustomTextField(
              controller: authCubit.registerEmailController,
              hint: "Enter your e-mail address",
              validator: (value) {
                return ValidationService.validateEmail(value);
              },
            ),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "Mobile number",
            customTextField: CustomTextField(
              controller: authCubit.registerMobileNumberController,
              hint: "Enter your mobile number",
              keyboardType: TextInputType.number,
              validator: (value) {
                return ValidationService.validatePhoneNumber(value);
              },
            ),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "Password",
            customTextField: CustomTextField(
              controller: authCubit.registerPasswordController,
              hint: "Enter your password",
              isPassword: true,
              maxLines: 1,
              validator: (value) {
                return ValidationService.validatePassword(value);
              },
            ),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "Confirm Password",
            customTextField: CustomTextField(
              controller: authCubit.registerConfirmPasswordController,
              hint: "Re-Enter your password",
              isPassword: true,
              maxLines: 1,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'You must enter your password';
                }

                if (value != authCubit.registerPasswordController.text) {
                  return "Passwords doesn't match";
                }

                return null;
              },
            ),
          ),
          SizedBox(height: 56.h),
          CustomMaterialButton(
            title: "Sign Up",
            backgroundColor: Colors.white,
            onClicked: () {
              if (_registerFormKey.currentState!.validate()) {
                authCubit.register();
              }
            },
          ),
        ],
      ),
    );
  }
}
