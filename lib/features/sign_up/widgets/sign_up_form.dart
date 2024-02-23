import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/page_route_names.dart';
import '../../../core/widgets/custom_input_field.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../main.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomInputField(
            title: "Full Name",
            customTextField: CustomTextField(
              hint: "Enter your full name",
            ),
          ),
          SizedBox(height: 32.h),
          const CustomInputField(
            title: "E-mail address",
            customTextField: CustomTextField(
              hint: "Enter your e-mail address",
            ),
          ),
          SizedBox(height: 32.h),
          const CustomInputField(
            title: "Mobile number",
            customTextField: CustomTextField(
              hint: "Enter your mobile number",
            ),
          ),
          SizedBox(height: 32.h),
          CustomInputField(
            title: "Password",
            customTextField: CustomTextField(
              onTap: () {},
              hint: "Enter your password",
              isPassword: true,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 56.h),
          CustomMaterialButton(
            title: "Sign Up",
            backgroundColor: Colors.white,
            onClicked: () {
              navigatorKey.currentState!.pushNamed(PageRouteNames.home);
            },
          ),
        ],
      ),
    );
  }
}
