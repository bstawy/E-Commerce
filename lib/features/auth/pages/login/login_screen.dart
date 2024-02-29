import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/page_route_names.dart';
import '../../../../core/data_services/local_storage/local_token_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/loading_service.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../manager/auth_cubit.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  getToken() async {
    String? token = await getIt<LocalTokenManager>().getToken();
    return token;
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();

    debugPrint("Token: ${getToken()}");

    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen: (previous, current) {
        if (previous is LoginLoadingState && current is! LoginLoadingState) {
          EasyLoading.dismiss();
        }
        return true;
      },
      listener: (context, state) {
        switch (state) {
          case LoginLoadingState():
            {
              configureEasyLoading();
              EasyLoading.show();
            }
            break;
          case LoginFailureState():
            {
              debugPrint("Exception: ${state.serverFailure}");
              SnackBarService.showErrorMessage(
                  context, state.serverFailure.message!);
            }
            break;
          case LoginSuccessState():
            {
              debugPrint("LoginScreen");
              debugPrint("Success");
              debugPrint("Token: ${state.user.token}");
              SnackBarService.showSuccessMessage(context, "Welcome Back");
              Navigator.of(context).pushNamed(PageRouteNames.initial);
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
              SizedBox(height: 92.h),
              Text(
                "Welcome Back To Route",
                style: context.theme.textTheme.titleMedium!.copyWith(
                  color: context.theme.colorScheme.background,
                ),
              ),
              Text(
                "Please sign in with your email",
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.background,
                ),
              ),
              SizedBox(height: 46.h),
              const LoginForm(),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PageRouteNames.signUp);
                },
                child: Text(
                  "Don't have an account?\nCreate Account",
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
