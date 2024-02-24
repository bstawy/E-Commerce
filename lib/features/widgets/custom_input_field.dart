import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/extensions.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final Widget customTextField;

  const CustomInputField({
    super.key,
    required this.title,
    required this.customTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.theme.textTheme.titleSmall,
        ),
        SizedBox(height: 16.h),
        customTextField,
      ],
    );
  }
}
