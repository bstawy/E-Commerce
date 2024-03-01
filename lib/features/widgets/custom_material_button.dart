import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/extensions.dart';

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? minWidth;
  final double? padding;
  final double? borderRadius;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final BorderSide? borderSide;
  final Function onClicked;

  const CustomMaterialButton({
    super.key,
    required this.title,
    this.height,
    this.minWidth,
    this.padding,
    this.borderRadius,
    required this.backgroundColor,
    this.titleStyle,
    this.borderSide,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: height ?? 64.h,
      minWidth: minWidth ?? double.infinity,
      elevation: 0,
      padding: EdgeInsets.all(padding ?? 16.h),
      color: backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        borderSide: borderSide ?? BorderSide.none,
      ),
      child: Text(
        title,
        style: titleStyle ?? context.theme.textTheme.titleMedium,
      ),
    );
  }
}
