import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/page_route_names.dart';
import '../../../core/extensions/extensions.dart';
import '../../widgets/custom_material_button.dart';

class LoginRequiredWidget extends StatelessWidget {
  final String message;

  const LoginRequiredWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleLarge!.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ).setHorizontalPadding(context, 50.w),
        const SizedBox(height: 20),
        CustomMaterialButton(
          onClicked: () {
            Navigator.pushNamed(context, PageRouteNames.login);
          },
          backgroundColor: context.theme.colorScheme.primary,
          title: "Login",
          titleStyle: context.theme.textTheme.titleMedium!.copyWith(
            color: context.theme.colorScheme.background,
          ),
        ).setHorizontalPadding(context, 100.w),
      ],
    );
  }
}
