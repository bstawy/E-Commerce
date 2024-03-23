import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/loading_service.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../manager/auth_cubit.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen: (previous, current) {
        if (previous is RegisterLoadingState &&
            current is! RegisterLoadingState) {
          EasyLoading.dismiss();
        }
        return true;
      },
      listener: (context, state) {
        switch (state) {
          case RegisterLoadingState():
            {
              configureEasyLoading();
              EasyLoading.show();
            }
            break;
          case RegisterFailureState():
            {
              EasyLoading.dismiss();
              SnackBarService.showErrorMessage(
                  context, state.serverFailure.message!);
            }
            break;
          case RegisterSuccessState():
            {
              EasyLoading.dismiss();
              SnackBarService.showSuccessMessage(
                  context, "Account created successfully");
              context.pop();
            }
            break;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: context.theme.colorScheme.primary,
        appBar: AppBar(
          leading: BackButton(color: context.theme.colorScheme.background),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset("assets/images/route_logo.svg"),
              SizedBox(height: 46.h),
              const RegisterForm(),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  "Already have an account? Login",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    color: context.theme.colorScheme.background,
                  ),
                ),
              ),
            ],
          ).setHorizontalAndVerticalPadding(context, 32.w, 24.h),
        ),
      ),
    );
  }
}
