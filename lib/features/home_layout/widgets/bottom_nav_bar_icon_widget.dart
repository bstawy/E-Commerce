import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extensions/extensions.dart';

class BottomNavBarIconWidget extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const BottomNavBarIconWidget({
    super.key,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? context.theme.colorScheme.primary : Colors.white,
          BlendMode.srcIn,
        ),
        width: 24.w,
        height: 24.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
